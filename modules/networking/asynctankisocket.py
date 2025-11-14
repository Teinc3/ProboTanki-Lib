import asyncio
import ssl
import aiosocks
import zlib
import socket
from aiosocks.errors import SocksError, SocksConnectionError
from typing import Callable, Awaitable

from ..security import CProtection
from ..misc import packetManager
from ...packets import AbstractPacket
from ...utils import Address, EByteArray


class AsyncTankiSocket:
    ENDPOINT = Address("146.59.110.146", 25565)  # core-protanki.com

    SOCKET_RETRY_DELAY = 2  # seconds
    SOCKET_MAX_RETRIES = 3  # max retries for connection

    def __init__(
        self,
        protection: CProtection,
        proxy: Address | None,
        emergency_halt: asyncio.Event, 
        on_data_received: Callable[[AbstractPacket], Awaitable[None]],
        on_socket_close: Callable[[Exception | str, str, str, bool, bool, bool], Awaitable[None]]
    ):
        self.protection = protection
        self.proxy = proxy
        self.emergency_halt = emergency_halt
        self.on_data_received = on_data_received
        self.on_socket_close = on_socket_close
        
        self.reader: asyncio.StreamReader | None = None
        self.writer: asyncio.StreamWriter | None = None
        
        # Start socket processing task
        self.processing_task = asyncio.create_task(self.process_socket())
    
    async def process_socket(self):
        """Main socket processing loop"""
        try:
            if not await self.connect():
                return
                
            while not self.emergency_halt.is_set():
                try:
                    packet_len, packet_id, is_compressed = await self.read_packet_header()
                    packet_data_len = packet_len - AbstractPacket.HEADER_LEN
                    
                    if packet_data_len > 0:
                        encrypted_data = await self.read_packet_data(packet_data_len)
                    else:
                        encrypted_data = EByteArray()
                        
                    await self.process_packet(packet_id, encrypted_data, is_compressed)
                
                except asyncio.CancelledError:
                    break

                except Exception as e:
                    await self.on_socket_close(
                        e, "AsyncTankiSocket.process_socket", 
                        f"Connected | Packet Length: {packet_len if 'packet_len' in locals() else 'N/A'} | "
                        f"Packet ID: {packet_id if 'packet_id' in locals() else 'N/A'}"
                    )
                    break

        except asyncio.CancelledError:
            # Task was cancelled, clean up
            await self.close_socket()
    
    async def connect(self):
        """Establish connection to endpoint with retry and backoff"""

        for attempt in range(self.SOCKET_MAX_RETRIES):
            try:
                # Check if already connected
                if self.writer and not self.writer.is_closing():
                    return True
                
                # Close existing connection if any
                if self.writer:
                    self.writer.close()
                    await self.writer.wait_closed()
                
                if self.proxy:
                    # Correctly use aiosocks according to documentation
                    # Create Socks5Addr and Socks5Auth objects
                    proxy_addr = aiosocks.Socks5Addr(
                        self.proxy.host, 
                        self.proxy.port
                    )
                    
                    # Create auth object if credentials provided
                    proxy_auth = None
                    if self.proxy.username and self.proxy.password:
                        proxy_auth = aiosocks.Socks5Auth(
                            self.proxy.username, 
                            self.proxy.password
                        )
                    
                    # Use open_connection with proxy parameters
                    self.reader, self.writer = await aiosocks.open_connection(
                        proxy=proxy_addr,
                        proxy_auth=proxy_auth,
                        dst=(self.ENDPOINT.host, self.ENDPOINT.port),
                        remote_resolve=True,  # Let the proxy resolve the hostname
                        ssl=ssl.create_default_context() if self.ENDPOINT.port == 443 else None
                    )
                else:
                    # Direct connection
                    self.reader, self.writer = await asyncio.open_connection(
                        self.ENDPOINT.host, 
                        self.ENDPOINT.port,
                        ssl=ssl.create_default_context() if self.ENDPOINT.port == 443 else None
                    )

                if self.writer:
                    sock: socket.socket | None = self.writer.get_extra_info('socket')
                    if sock:
                        sock.setsockopt(socket.IPPROTO_TCP, socket.TCP_NODELAY, 1)
                
                return True
                
            except (SocksError, SocksConnectionError) as e:
                # Specific SOCKS errors
                if attempt < self.SOCKET_MAX_RETRIES - 1:
                    # Exponential backoff
                    backoff_time = self.SOCKET_RETRY_DELAY * (2 ** attempt)
                    await asyncio.sleep(backoff_time)
                else:
                    await self.on_socket_close(
                        e, "AsyncTankiSocket.connect", 
                        f"SOCKS Proxy Error | Proxy: {self.proxy}"
                    )
                    return False
                
            except Exception as e:
                if attempt < self.SOCKET_MAX_RETRIES - 1:
                    # Exponential backoff
                    backoff_time = self.SOCKET_RETRY_DELAY * (2 ** attempt)
                    await asyncio.sleep(backoff_time)
                else:
                    await self.on_socket_close(
                        e, "AsyncTankiSocket.connect", 
                        f"Not Connected | Proxy: {self.proxy}"
                    )
                    return False
        
        return False
    
    async def read_packet_header(self) -> tuple[int, int, bool]:
        """Read packet header asynchronously"""
        if not self.reader:
            raise ConnectionError("Not connected")
            
        # Read header (1 byte compression, 3 bytes length)
        header_len_bytes = EByteArray(await self.reader.readexactly(4))
        header_data = header_len_bytes.read_int()

        is_compressed = ((header_data >> 24) & 0x40) != 0
        packet_len = header_data & 0x00FFFFFF  # Nullifies the compression bit
        
        # Read packet ID (4 bytes)
        packet_id_bytes = EByteArray(await self.reader.readexactly(4))
        packet_id = packet_id_bytes.read_int()
        
        return packet_len, packet_id, is_compressed
    
    async def read_packet_data(self, data_len: int) -> EByteArray:
        """Read packet data asynchronously"""

        if not self.reader:
            raise ConnectionError("Not connected")
            
        # Read exact number of bytes
        data = await self.reader.readexactly(data_len)
        return EByteArray(data)

    async def process_packet(self, packet_id: int, encrypted_data: EByteArray, is_compressed: bool):
        """Process received packet"""

        packet_data = self.protection.decrypt(bytearray(encrypted_data))
        if is_compressed:
            packet_data = zlib.decompress(packet_data, wbits=-zlib.MAX_WBITS)
        fitted_packet = self.packet_fitter(packet_id, EByteArray(packet_data))
        await self.on_data_received(fitted_packet)
    
    def packet_fitter(self, packet_id: int, packet_data: EByteArray) -> AbstractPacket:
        """Convert raw packet data to packet object"""

        Packet = packetManager.get_packet(packet_id)
        if Packet is None:
            packet = AbstractPacket()
            packet.id = packet_id
            packet.objects = [packet_data]
            packet.object = {'data': packet_data}
            return packet
            
        current_packet = Packet()
        current_packet.unwrap(packet_data)
        return current_packet
    
    async def send_batch(self, packets_data: list[EByteArray]):
        """Pack a batch of packets into a single send operation"""

        await self.send(b''.join(packets_data))
    
    async def send(self, packet_data: EByteArray):
        """Send packet data asynchronously"""

        if not self.writer or self.writer.is_closing():
            self.writer = None
        
        if not self.emergency_halt.is_set():
            self.writer.write(packet_data)
            try:
                await self.writer.drain()
            except:
                self.writer = None
        
    async def close_socket(self):
        """Close the connection"""

        if self.writer:
            self.writer.close()
            self.writer = None
        self.reader = None
        
        # Cancel processing task if running
        if hasattr(self, 'processing_task') and not self.processing_task.done():
            self.processing_task.cancel()
            try:
                await self.processing_task
            except asyncio.CancelledError:
                pass


__all__ = ["AsyncTankiSocket"]