package projects.tanks.clients.fp10.libraries.tanksservices.service.notifier.online
{
   import flash.events.EventDispatcher;
   import flash.utils.Dictionary;
   import platform.client.fp10.core.network.connection.ConnectionCloseStatus;
   import platform.client.fp10.core.network.handler.OnConnectionClosedServiceListener;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.online.ClientOnlineNotifierData;
   
   public class Renamed589 extends EventDispatcher implements IOnlineNotifierService, OnConnectionClosedServiceListener
   {
      private var Renamed4523:Dictionary;
      
      public function Renamed589()
      {
         this.Renamed4523 = new Dictionary();
         super();
      }
      
      public function onConnectionClosed(param1:ConnectionCloseStatus) : void
      {
         this.Renamed4523 = new Dictionary();
      }
      
      public function setOnline(param1:Vector.<ClientOnlineNotifierData>) : void
      {
         dispatchEvent(new OnlineNotifierServiceEvent(OnlineNotifierServiceEvent.SET_ONLINE,param1));
      }
      
      public function addUserOnlineData(param1:ClientOnlineNotifierData) : void
      {
         this.Renamed4523[param1.userId] = param1;
      }
      
      public function removeUserOnlineData(param1:String) : void
      {
         delete this.Renamed4523[param1];
      }
      
      public function hasUserOnlineData(param1:String) : Boolean
      {
         return param1 in this.Renamed4523;
      }
      
      public function getUserOnlineData(param1:String) : ClientOnlineNotifierData
      {
         return this.Renamed4523[param1];
      }
   }
}

