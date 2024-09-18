package Renamed4561
{
   import alternativa.tanks.battle.Renamed768;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.events.Renamed874;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Renamed900;
   import alternativa.tanks.battle.events.Renamed511;
   import flash.utils.getTimer;
   import platform.client.fp10.core.type.AutoClosable;
   import projects.tanks.client.commons.models.layout.LayoutState;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.IDialogWindowsDispatcherService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   
   public class Renamed4563 implements AutoClosable, Renamed511, Renamed768
   {
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var dialogWindowsDispatcherService:IDialogWindowsDispatcherService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      private static const Renamed5907:int = 60;
      
      private var Renamed5908:int;
      
      private var _alert:Renamed4562;
      
      private var Renamed5909:Boolean;
      
      public function Renamed4563()
      {
         super();
         this.init();
      }
      
      private static function Renamed5910() : Boolean
      {
         return !lobbyLayoutService.isSwitchInProgress() && lobbyLayoutService.isWindowOpenOverBattle();
      }
      
      private static function Renamed5911() : void
      {
         var _loc1_:LayoutState = lobbyLayoutService.getCurrentState();
         if(_loc1_ != LayoutState.BATTLE)
         {
            lobbyLayoutService.Renamed4456();
         }
      }
      
      private function init() : void
      {
         battleEventDispatcher.Renamed539(Renamed874,this);
         battleEventDispatcher.Renamed539(Renamed900,this);
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         if(param1 is Renamed874)
         {
            this.Renamed5912(Renamed874(param1));
         }
         else if(param1 is Renamed900)
         {
            this.Renamed5913();
         }
      }
      
      private function Renamed5912(param1:Renamed874) : void
      {
         if(this.Renamed5909)
         {
            return;
         }
         this.Renamed5909 = true;
         this.Renamed5908 = getTimer() + param1.Renamed875;
         battleService.Renamed619().Renamed815(this);
      }
      
      private function Renamed5913() : void
      {
         if(!this.Renamed5909)
         {
            return;
         }
         this.Renamed5909 = false;
         battleService.Renamed619().Renamed816(this);
         this.destroyAlert();
      }
      
      private function destroyAlert() : void
      {
         if(this.Renamed5914())
         {
            this._alert.removeEventListener(NotificationEndsPausedAlertEvent.RETURN_TO_BATTLE,this.onReturnToBattle);
            this._alert.removeEventListener(NotificationEndsPausedAlertEvent.CLOSE_ALERT,this.Renamed5915);
            this._alert.destroy();
            this._alert = null;
         }
      }
      
      public function Renamed769(param1:int, param2:int) : void
      {
         var _loc3_:int = (this.Renamed5908 - param1) / 1000;
         if(_loc3_ <= Renamed5907)
         {
            if(this.Renamed5914())
            {
               this._alert.seconds = Math.max(_loc3_,0);
            }
            else if(Renamed5910())
            {
               this.Renamed5916(_loc3_);
            }
         }
      }
      
      private function Renamed5914() : Boolean
      {
         return this._alert != null;
      }
      
      private function Renamed5916(param1:int) : void
      {
         this._alert = new Renamed4562();
         this._alert.addEventListener(NotificationEndsPausedAlertEvent.RETURN_TO_BATTLE,this.onReturnToBattle);
         this._alert.addEventListener(NotificationEndsPausedAlertEvent.CLOSE_ALERT,this.Renamed5915);
         this._alert.seconds = param1;
         this._alert.show();
      }
      
      private function Renamed5915(param1:NotificationEndsPausedAlertEvent = null) : void
      {
         this.Renamed5913();
      }
      
      private function onReturnToBattle(param1:NotificationEndsPausedAlertEvent) : void
      {
         dialogWindowsDispatcherService.forciblyClose();
         Renamed5911();
         this.Renamed5913();
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.destroyAlert();
         battleEventDispatcher.Renamed866(Renamed874,this);
         battleEventDispatcher.Renamed866(Renamed900,this);
      }
   }
}

