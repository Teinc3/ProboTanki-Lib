package §&<§
{
   import alternativa.tanks.battle.§;!t§;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.events.§##`§;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.§set var native§;
   import alternativa.tanks.battle.events.§throw package continue§;
   import flash.utils.getTimer;
   import platform.client.fp10.core.type.AutoClosable;
   import projects.tanks.client.commons.models.layout.LayoutState;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.IDialogWindowsDispatcherService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   
   public class §implements const include§ implements AutoClosable, §throw package continue§, §;!t§
   {
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var dialogWindowsDispatcherService:IDialogWindowsDispatcherService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      private static const §<"y§:int = 60;
      
      private var §,"1§:int;
      
      private var _alert:§#u§;
      
      private var §in break§:Boolean;
      
      public function §implements const include§()
      {
         super();
         this.init();
      }
      
      private static function §const const get§() : Boolean
      {
         return !lobbyLayoutService.isSwitchInProgress() && lobbyLayoutService.isWindowOpenOverBattle();
      }
      
      private static function §return if§() : void
      {
         var _loc1_:LayoutState = lobbyLayoutService.getCurrentState();
         if(_loc1_ != LayoutState.BATTLE)
         {
            lobbyLayoutService.§ #8§();
         }
      }
      
      private function init() : void
      {
         battleEventDispatcher.§set for each§(§##`§,this);
         battleEventDispatcher.§set for each§(§set var native§,this);
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         if(param1 is §##`§)
         {
            this.§switch for switch§(§##`§(param1));
         }
         else if(param1 is §set var native§)
         {
            this.§dynamic var static§();
         }
      }
      
      private function §switch for switch§(param1:§##`§) : void
      {
         if(this.§in break§)
         {
            return;
         }
         this.§in break§ = true;
         this.§,"1§ = getTimer() + param1.§switch var false§;
         battleService.§'x§().§%#9§(this);
      }
      
      private function §dynamic var static§() : void
      {
         if(!this.§in break§)
         {
            return;
         }
         this.§in break§ = false;
         battleService.§'x§().§%"7§(this);
         this.destroyAlert();
      }
      
      private function destroyAlert() : void
      {
         if(this.§,!J§())
         {
            this._alert.removeEventListener(NotificationEndsPausedAlertEvent.RETURN_TO_BATTLE,this.onReturnToBattle);
            this._alert.removeEventListener(NotificationEndsPausedAlertEvent.CLOSE_ALERT,this.§8"R§);
            this._alert.destroy();
            this._alert = null;
         }
      }
      
      public function §var package implements§(param1:int, param2:int) : void
      {
         var _loc3_:int = (this.§,"1§ - param1) / 1000;
         if(_loc3_ <= §<"y§)
         {
            if(this.§,!J§())
            {
               this._alert.seconds = Math.max(_loc3_,0);
            }
            else if(§const const get§())
            {
               this.§9!W§(_loc3_);
            }
         }
      }
      
      private function §,!J§() : Boolean
      {
         return this._alert != null;
      }
      
      private function §9!W§(param1:int) : void
      {
         this._alert = new §#u§();
         this._alert.addEventListener(NotificationEndsPausedAlertEvent.RETURN_TO_BATTLE,this.onReturnToBattle);
         this._alert.addEventListener(NotificationEndsPausedAlertEvent.CLOSE_ALERT,this.§8"R§);
         this._alert.seconds = param1;
         this._alert.show();
      }
      
      private function §8"R§(param1:NotificationEndsPausedAlertEvent = null) : void
      {
         this.§dynamic var static§();
      }
      
      private function onReturnToBattle(param1:NotificationEndsPausedAlertEvent) : void
      {
         dialogWindowsDispatcherService.forciblyClose();
         §return if§();
         this.§dynamic var static§();
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.destroyAlert();
         battleEventDispatcher.§7!3§(§##`§,this);
         battleEventDispatcher.§7!3§(§set var native§,this);
      }
   }
}

