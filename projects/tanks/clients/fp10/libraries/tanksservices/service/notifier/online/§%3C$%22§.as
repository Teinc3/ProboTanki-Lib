package projects.tanks.clients.fp10.libraries.tanksservices.service.notifier.online
{
   import flash.events.EventDispatcher;
   import flash.utils.Dictionary;
   import platform.client.fp10.core.network.connection.ConnectionCloseStatus;
   import platform.client.fp10.core.network.handler.OnConnectionClosedServiceListener;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.online.ClientOnlineNotifierData;
   
   public class §<$"§ extends EventDispatcher implements IOnlineNotifierService, OnConnectionClosedServiceListener
   {
      private var §@#<§:Dictionary;
      
      public function §<$"§()
      {
         this.§@#<§ = new Dictionary();
         super();
      }
      
      public function onConnectionClosed(param1:ConnectionCloseStatus) : void
      {
         this.§@#<§ = new Dictionary();
      }
      
      public function setOnline(param1:Vector.<ClientOnlineNotifierData>) : void
      {
         dispatchEvent(new OnlineNotifierServiceEvent(OnlineNotifierServiceEvent.SET_ONLINE,param1));
      }
      
      public function addUserOnlineData(param1:ClientOnlineNotifierData) : void
      {
         this.§@#<§[param1.userId] = param1;
      }
      
      public function removeUserOnlineData(param1:String) : void
      {
         delete this.§@#<§[param1];
      }
      
      public function hasUserOnlineData(param1:String) : Boolean
      {
         return param1 in this.§@#<§;
      }
      
      public function getUserOnlineData(param1:String) : ClientOnlineNotifierData
      {
         return this.§@#<§[param1];
      }
   }
}

