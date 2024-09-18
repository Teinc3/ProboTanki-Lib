package scpacker.networking
{
   import § M§.§true else§;
   import §&#;§.AbstractPacket;
   import §&#;§.§^#K§;
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
   import scpacker.networking.protocol.§?"s§;
   
   public class Network
   {
      public static var §["b§:§true else§;
      
      public static var §;!§:§?"s§;
      
      private static var §package package extends§:§^#K§;
      
      private var socket:Socket;
      
      private var currentPacketPosition:int;
      
      private var §9"L§:Boolean = false;
      
      private var §catch var import§:Boolean = true;
      
      private var §finally for dynamic§:ByteArray;
      
      private var rawDataBuffer:ByteArray;
      
      private var dataBuffer:ByteArray;
      
      public function Network()
      {
         this.§finally for dynamic§ = new ByteArray();
         this.rawDataBuffer = new ByteArray();
         this.dataBuffer = new ByteArray();
         super();
         this.socket = new Socket();
         §package package extends§ = new §^#K§();
         §["b§ = new §true else§();
         OSGi.getInstance().registerService(§true else§,§["b§);
         OSGi.getInstance().registerService(§^#K§,§package package extends§);
         OSGi.getInstance().registerService(§?"s§,§;!§ = new §?"s§());
      }
      
      public function connect(param1:String, param2:int) : void
      {
         var _loc3_:§?"s§ = §?"s§(OSGi.getInstance().getService(§?"s§));
         _loc3_.init();
         new §catch final§().start(OSGi.getInstance());
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
         this.§=!d§();
      }
      
      private function §=!d§() : void
      {
         var §if for case§:int = 0;
         var §=!$§:int = 0;
         var §'#-§:int = 0;
         var §-#H§:AbstractPacket = null;
         this.dataBuffer.position = this.currentPacketPosition;
         if(this.dataBuffer.bytesAvailable == 0)
         {
            return;
         }
         while(true)
         {
            if(this.dataBuffer.bytesAvailable < AbstractPacket.§,#,§)
            {
               return;
            }
            §if for case§ = this.dataBuffer.readInt();
            §=!$§ = this.dataBuffer.readInt();
            §'#-§ = §if for case§ - AbstractPacket.§,#,§;
            if(this.dataBuffer.bytesAvailable < §'#-§)
            {
               return;
            }
            if(§'#-§ > 0)
            {
               this.dataBuffer.readBytes(this.§finally for dynamic§,0,§'#-§);
            }
            try
            {
               §;!§.§2"C§().decrypt(this.§finally for dynamic§);
               §-#H§ = §package package extends§.§function package do§(§=!$§);
               §-#H§.unwrap(this.§finally for dynamic§);
               §["b§.invoke(§-#H§);
            }
            catch(e:Error)
            {
               OSGi.clientLog.log("net","error packet %1 packetLength %2 packetId %3 \n\n %4",§-#H§,§if for case§,§=!$§,e.getStackTrace());
            }
            this.§finally for dynamic§.clear();
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

