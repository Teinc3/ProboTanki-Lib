package scpacker.networking
{
   import Renamed140.ModelHolder;
   import AbstractPackets.AbstractPacket;
   import AbstractPackets.AbstractPacketManager;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.bg.IBackgroundService;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.Socket;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.network.connection.ConnectionCloseStatus;
   import platform.client.fp10.core.network.handler.OnConnectionClosedServiceListener;
   import platform.client.fp10.core.service.errormessage.IErrorMessageService;
   import platform.client.fp10.core.service.errormessage.errors.ConnectionClosedError;
   import scpacker.networking.protocol.CodecRegisterer;
   
   public class Network
   {
      public static var modelHolder:ModelHolder;
      
      public static var codecRegisterer:CodecRegisterer;
      
      private static var absPacketManager:AbstractPacketManager;
      
      private var socket:Socket;
      
      private var currentPacketPosition:int;
      
      private var Renamed10518:Boolean = false;
      
      private var Renamed10519:Boolean = true;
      
      private var packetByteArray:ByteArray;
      
      private var rawDataBuffer:ByteArray;
      
      private var dataBuffer:ByteArray;
      
      public function Network()
      {
         this.packetByteArray = new ByteArray();
         this.rawDataBuffer = new ByteArray();
         this.dataBuffer = new ByteArray();
         super();
         this.socket = new Socket();
         absPacketManager = new AbstractPacketManager();
         modelHolder = new ModelHolder();
         OSGi.getInstance().registerService(ModelHolder,modelHolder);
         OSGi.getInstance().registerService(AbstractPacketManager,absPacketManager);
         OSGi.getInstance().registerService(CodecRegisterer,codecRegisterer = new CodecRegisterer());
      }
      
      public function connect(param1:String, param2:int) : void
      {
         var _loc3_:CodecRegisterer = CodecRegisterer(OSGi.getInstance().getService(CodecRegisterer));
         _loc3_.init();
         new ModelAbsPacketFiller().start(OSGi.getInstance());
         this.socket.connect(param1,param2);
         this.socket.addEventListener(ProgressEvent.SOCKET_DATA,this.onDataSocket);
         this.socket.addEventListener(Event.CONNECT,this.onConnected);
         this.socket.addEventListener(Event.CLOSE,this.onCloseConnecting);
         this.socket.addEventListener(IOErrorEvent.IO_ERROR,this.ioError);
         this.socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.securityError);
      }
      
      public function destroy() : void
      {
         this.socket.removeEventListener(ProgressEvent.SOCKET_DATA,this.onDataSocket);
         this.socket.removeEventListener(Event.CONNECT,this.onConnected);
         this.socket.removeEventListener(Event.CLOSE,this.onCloseConnecting);
         this.socket.removeEventListener(IOErrorEvent.IO_ERROR,this.ioError);
         this.socket.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.securityError);
      }
      
      public function send(param1:AbstractPacket) : void
      {
         var _loc2_:ByteArray = null;
         if(this.socket.connected)
         {
            _loc2_ = new ByteArray();
            param1.wrap(_loc2_);
            this.socket.writeBytes(_loc2_,0,param1.getLength());
            this.socket.flush();
         }
      }
      
      private function onConnected(param1:Event) : void
      {
      }
      
      private function onDataSocket(param1:Event) : void
      {
         this.socket.readBytes(this.dataBuffer,this.dataBuffer.length);
         this.processData();
      }
      
      private function processData() : void
      {
         var totalPacketLen:int = 0;
         var packetID:int = 0;
         var currPacketLen:int = 0;
         var absPacket:AbstractPacket = null;
         this.dataBuffer.position = this.currentPacketPosition;
         if(this.dataBuffer.bytesAvailable == 0)
         {
            return;
         }
         while(true)
         {
            if(this.dataBuffer.bytesAvailable < AbstractPacket.const_8)
            {
               return;
            }
            totalPacketLen = this.dataBuffer.readInt();
            packetID = this.dataBuffer.readInt();
            currPacketLen = totalPacketLen - AbstractPacket.const_8;
            if(this.dataBuffer.bytesAvailable < currPacketLen)
            {
               return;
            }
            if(currPacketLen > 0)
            {
               this.dataBuffer.readBytes(this.packetByteArray,0,currPacketLen);
            }
            try
            {
               codecRegisterer.getProtectionContext().decrypt(this.packetByteArray);
               absPacket = absPacketManager.getAbsPacket(packetID);
               absPacket.unwrap(this.packetByteArray);
               modelHolder.invoke(absPacket);
            }
            catch(e:Error)
            {
               OSGi.clientLog.log("net","error packet %1 packetLength %2 packetId %3 \n\n %4",absPacket,totalPacketLen,packetID,e.getStackTrace());
            }
            this.packetByteArray.clear();
            if(this.dataBuffer.bytesAvailable == 0)
            {
               break;
            }
            this.currentPacketPosition = this.dataBuffer.position;
         }
         this.dataBuffer.clear();
         this.currentPacketPosition = 0;
      }
      
      public function onCloseConnecting(param1:Event) : void
      {
         var _loc2_:Object = null;
         this.socket.flush();
         this.socket.close();
         var _loc3_:int = 0;
         while(_loc3_ < IDisplay(OSGi.getInstance().getService(IDisplay)).mainContainer.numChildren)
         {
            IDisplay(OSGi.getInstance().getService(IDisplay)).mainContainer.removeChildAt(1);
            _loc3_++;
         }
         IBackgroundService(OSGi.getInstance().getService(IBackgroundService)).drawBg();
         IBackgroundService(OSGi.getInstance().getService(IBackgroundService)).showBg();
         for each(_loc2_ in OSGi.getInstance().serviceList)
         {
            if(_loc2_ is OnConnectionClosedServiceListener)
            {
               OnConnectionClosedServiceListener(_loc2_).onConnectionClosed(ConnectionCloseStatus.CLOSED_BY_SERVER);
            }
         }
         IBackgroundService(OSGi.getInstance().getService(IBackgroundService)).drawBg();
         IBackgroundService(OSGi.getInstance().getService(IBackgroundService)).showBg();
         IErrorMessageService(OSGi.getInstance().getService(IErrorMessageService)).showMessage(new ConnectionClosedError(ConnectionCloseStatus.CLOSED_BY_SERVER));
      }
      
      private function ioError(param1:Event) : void
      {
         this.socket.flush();
         this.socket.close();
         IErrorMessageService(OSGi.getInstance().getService(IErrorMessageService)).showMessage(new ConnectionClosedError(ConnectionCloseStatus.CONNECTION_ERROR));
         IBackgroundService(OSGi.getInstance().getService(IBackgroundService)).drawBg();
         IBackgroundService(OSGi.getInstance().getService(IBackgroundService)).showBg();
      }
      
      private function securityError(param1:Event) : void
      {
         this.socket.flush();
         this.socket.close();
         IErrorMessageService(OSGi.getInstance().getService(IErrorMessageService)).showMessage(new ConnectionClosedError(ConnectionCloseStatus.CLOSED_BY_SERVER));
         IBackgroundService(OSGi.getInstance().getService(IBackgroundService)).drawBg();
         IBackgroundService(OSGi.getInstance().getService(IBackgroundService)).showBg();
      }
      
      public function socketConnected() : Boolean
      {
         return this.socket.connected;
      }
   }
}

