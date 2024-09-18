package projects.tanks.clients.flash.commons.services.notification
{
   import org.osflash.signals.Signal;
   import platform.client.fp10.core.network.connection.ConnectionCloseStatus;
   import platform.client.fp10.core.network.handler.OnConnectionClosedServiceListener;
   import projects.tanks.clients.flash.commons.services.layout.LobbyLayoutServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   
   public class NotificationService implements INotificationService, OnConnectionClosedServiceListener
   {
      private var _lobbyLayoutService:ILobbyLayoutService;
      
      private var _queue:Array;
      
      private var _showNotification:INotification;
      
      public function NotificationService(param1:ILobbyLayoutService)
      {
         super();
         this._lobbyLayoutService = param1;
         this.init();
      }
      
      private function init() : void
      {
         this._queue = [];
         this._lobbyLayoutService.addEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,this.onEndLayoutSwitch);
      }
      
      private function onEndLayoutSwitch(param1:LobbyLayoutServiceEvent) : void
      {
         this.updateQueue();
      }
      
      public function addNotification(param1:INotification, param2:Boolean = false) : void
      {
         if(param2)
         {
            this._queue.unshift(param1);
         }
         else
         {
            this._queue.push(param1);
         }
         this.updateQueue();
      }
      
      private function updateQueue() : void
      {
         var _loc1_:Signal = null;
         if(this.canShow())
         {
            this._showNotification = this._queue.shift();
            _loc1_ = new Signal();
            _loc1_.addOnce(this.onCloseNotification);
            this._showNotification.show(_loc1_);
         }
      }
      
      private function canShow() : Boolean
      {
         return !this._lobbyLayoutService.isSwitchInProgress() && this._showNotification == null && this._queue.length != 0;
      }
      
      private function onCloseNotification() : void
      {
         this._showNotification = null;
         this.updateQueue();
      }
      
      public function hasNotification(param1:String, param2:String) : Boolean
      {
         var _loc3_:Boolean = false;
         var _loc4_:INotification = null;
         if(this.isShowNotification(param1,param2))
         {
            return true;
         }
         var _loc5_:int = int(this._queue.length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = this._queue[_loc6_];
            if(_loc4_.userId == param1 && _loc4_.message == param2)
            {
               _loc3_ = true;
               break;
            }
            _loc6_++;
         }
         return _loc3_;
      }
      
      private function isShowNotification(param1:String, param2:String) : Boolean
      {
         return this._showNotification != null && this._showNotification.userId == param1 && this._showNotification.message == param2;
      }
      
      public function onConnectionClosed(param1:ConnectionCloseStatus) : void
      {
         if(this._showNotification)
         {
            this._showNotification.destroy();
            this._showNotification = null;
         }
         this._queue.length = 0;
      }
   }
}

