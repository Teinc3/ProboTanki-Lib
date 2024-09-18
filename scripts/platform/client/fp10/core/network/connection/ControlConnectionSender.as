package platform.client.fp10.core.network.connection
{
   import platform.client.fp10.core.network.ICommandSender;
   import platform.client.fp10.core.service.transport.ITransportService;
   
   public class ControlConnectionSender implements ICommandSender
   {
      [Inject]
      public static var transportService:ITransportService;
      
      public function ControlConnectionSender()
      {
         super();
      }
      
      public function sendCommand(param1:Object) : void
      {
         var _loc2_:ICommandSender = null;
         if(transportService == null || (_loc2_ = transportService.controlConnection) == null)
         {
            return;
         }
         _loc2_.sendCommand(param1);
      }
   }
}

