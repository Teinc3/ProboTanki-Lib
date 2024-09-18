package scpacker.networking.connecting
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.network.INetworkService;
   import scpacker.networking.Network;
   
   public class ServerConnectionServiceImpl implements ServerConnectionService
   {
      public static var networkService:INetworkService;
      
      private var networker:Network;
      
      public function ServerConnectionServiceImpl()
      {
         super();
      }
      
      public function connect() : void
      {
         this.networker = Network(OSGi.getInstance().getService(Network));
         networkService = OSGi.getInstance().getService(INetworkService) as INetworkService;
         var _loc1_:String = networkService.controlServerAddress;
         var _loc2_:int = networkService.controlServerPorts[0];
         OSGi.clientLog.log("net","Connecting to server");
         this.networker.connect(_loc1_,_loc2_);
         OSGi.clientLog.log("net","Connected to server");
      }
   }
}

