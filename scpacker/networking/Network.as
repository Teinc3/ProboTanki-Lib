package scpacker.networking
{
   import Renamed140.Renamed4936;
   import Renamed189.AbstractPacket;
   import Renamed189.Renamed5817;
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
   import scpacker.networking.protocol.Renamed536;
   
   public class Network
   {
      public static var Renamed10516:Renamed4936;
      
      public static var Renamed5812:Renamed536;
      
      private static var Renamed10517:Renamed5817;
      
      private var socket:Socket;
      
      private var currentPacketPosition:int;
      
      private var Renamed10518:Boolean = false;
      
      private var Renamed10519:Boolean = true;
      
      private var Renamed5815:ByteArray;
      
      private var rawDataBuffer:ByteArray;
      
      private var dataBuffer:ByteArray;
      
      public function Network()
      {
         this.Renamed5815 = new ByteArray();
         this.rawDataBuffer = new ByteArray();
         this.dataBuffer = new ByteArray();
         super();
         this.socket = new Socket();
         Renamed10517 = new Renamed5817();
         Renamed10516 = new Renamed4936();
         OSGi.getInstance().registerService(Renamed4936,Renamed10516);
         OSGi.getInstance().registerService(Renamed5817,Renamed10517);
         OSGi.getInstance().registerService(Renamed536,Renamed5812 = new Renamed536());
      }
      
      public function connect(param1:String, param2:int) : void
      {
         var _loc3_:Renamed536 = Renamed536(OSGi.getInstance().getService(Renamed536));
         _loc3_.init();
         new Renamed10520().start(OSGi.getInstance());
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
         this.Renamed10521();
      }
      
      private function Renamed10521() : void
      {
         var Renamed10522:int = 0;
         var Renamed10523:int = 0;
         var Renamed10524:int = 0;
         var Renamed8774:AbstractPacket = null;
         this.dataBuffer.position = this.currentPacketPosition;
         if(this.dataBuffer.bytesAvailable == 0)
         {
            return;
         }
         while(true)
         {
            if(this.dataBuffer.bytesAvailable < AbstractPacket.Renamed5813)
            {
               return;
            }
            Renamed10522 = this.dataBuffer.readInt();
            Renamed10523 = this.dataBuffer.readInt();
            Renamed10524 = Renamed10522 - AbstractPacket.Renamed5813;
            if(this.dataBuffer.bytesAvailable < Renamed10524)
            {
               return;
            }
            if(Renamed10524 > 0)
            {
               this.dataBuffer.readBytes(this.Renamed5815,0,Renamed10524);
            }
            try
            {
               Renamed5812.Renamed5816().decrypt(this.Renamed5815);
               Renamed8774 = Renamed10517.Renamed5820(Renamed10523);
               Renamed8774.unwrap(this.Renamed5815);
               Renamed10516.invoke(Renamed8774);
            }
            catch(e:Error)
            {
               OSGi.clientLog.log("net","error packet %1 packetLength %2 packetId %3 \n\n %4",Renamed8774,Renamed10522,Renamed10523,e.getStackTrace());
            }
            this.Renamed5815.clear();
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

