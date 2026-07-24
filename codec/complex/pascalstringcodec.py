from ..basecodec import BaseCodec
from ..primitive import ByteCodec
from ...utils import EByteArray


class PascalStringCodec(BaseCodec[str]):

    def decode(self):
        length = ByteCodec(self._buffer).decode()
        if length < 0:
            length += 256
        if length == 0:
            return ""
        return self._buffer.read_string(length)

    def encode(self, value):
        string_buffer = EByteArray().write_string(value or "")
        length = len(string_buffer)
        if length > 255:
            raise ValueError(
                f"PascalStringCodec can only encode up to 255 bytes, got {length}"
            )

        bytes_written = ByteCodec(self._buffer).encode(length if length <= 127 else length - 256)
        self._buffer.write(string_buffer)
        return bytes_written + length
