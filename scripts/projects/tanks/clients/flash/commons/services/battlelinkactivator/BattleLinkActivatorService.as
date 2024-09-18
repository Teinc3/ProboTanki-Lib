package projects.tanks.clients.flash.commons.services.battlelinkactivator
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.blur.IBlurService;
   import alternativa.tanks.locale.constants.TextConst;
   import flash.events.EventDispatcher;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import projects.tanks.client.commons.models.layout.LayoutState;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.AlertServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.IDialogWindowsDispatcherService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class BattleLinkActivatorService extends EventDispatcher implements IBattleLinkActivatorService
   {
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      [Inject]
      public static var blurService:IBlurService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var dialogWindowsDispatcherService:IDialogWindowsDispatcherService;
      
      [Inject]
      public static var alertService:IAlertService;
      
      [Inject]
      public static var storageService:IStorageService;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var userPropertyService:IUserPropertiesService;
      
      private var _url:String;
      
      private var _remote:Boolean;
      
      public function BattleLinkActivatorService()
      {
         super();
      }
      
      public function navigateToBattleUrlWithoutAvailableBattle(param1:String, param2:Boolean) : void
      {
         this.navigateToBattleUrl(param1,param2,true);
      }
      
      public function navigateToBattleUrl(param1:String, param2:Boolean, param3:Boolean) : void
      {
         this._url = param1;
         this._remote = param2;
         if(battleInfoService.spectator)
         {
            this.navigate(this._url,this._remote);
            return;
         }
         if(lobbyLayoutService.getCurrentState() == LayoutState.BATTLE)
         {
            this.navigateOfBattle(param3);
         }
         else
         {
            this.navigateToBattle(param3);
         }
      }
      
      private function navigateToBattle(param1:Boolean) : void
      {
         var _loc2_:String = null;
         if(!param1)
         {
            _loc2_ = localeService.getText(TextConst.STRING_ALERT_GOT_TO_BATTLE_IS_UNAVAILABLE_RANK);
            alertService.showAlert(_loc2_,Vector.<String>([localeService.getText(TextConst.STRING_GO_TO_BATTLE_LABEL),localeService.getText(TextConst.STRING_DECLINE_LABEL)]));
            alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onConfirmGoToNavigateToBattleUrl);
         }
         else
         {
            this.navigate(this._url,this._remote);
         }
      }
      
      private function navigateOfBattle(param1:Boolean) : String
      {
         var _loc2_:String = null;
         if(param1)
         {
            _loc2_ = localeService.getText(TanksLocale.TEXT_FRIENDS_EXIT_FROM_BATTLE_ALERT);
         }
         else
         {
            _loc2_ = localeService.getText(TextConst.STRING_ALERT_GO_TO_BATTLE_IS_UNAVAILABLE_RANK_FUND);
         }
         alertService.showAlert(_loc2_,Vector.<String>([localeService.getText(TextConst.ALERT_ANSWER_YES),localeService.getText(TextConst.ALERT_ANSWER_NO)]));
         alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onConfirmYesNavigateToBattleUrl);
         return _loc2_;
      }
      
      private function navigate(param1:String, param2:Boolean) : void
      {
         if(param2)
         {
            this.rememberShowAlertDeadBattle();
            navigateToURL(new URLRequest(param1),"_self");
         }
         else
         {
            this.activateLink(param1);
         }
      }
      
      private function onConfirmYesNavigateToBattleUrl(param1:AlertServiceEvent) : void
      {
         alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onConfirmYesNavigateToBattleUrl);
         this.confirmNavigateToBattleUrl(param1,localeService.getText(TextConst.ALERT_ANSWER_YES),localeService.getText(TextConst.ALERT_ANSWER_NO));
      }
      
      private function onConfirmGoToNavigateToBattleUrl(param1:AlertServiceEvent) : void
      {
         alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onConfirmGoToNavigateToBattleUrl);
         this.confirmNavigateToBattleUrl(param1,localeService.getText(TextConst.STRING_GO_TO_BATTLE_LABEL),localeService.getText(TextConst.STRING_DECLINE_LABEL));
      }
      
      private function confirmNavigateToBattleUrl(param1:AlertServiceEvent, param2:String, param3:String) : void
      {
         if(param1.typeButton == param2)
         {
            dispatchEvent(new BattleLinkActivatorServiceEvent(BattleLinkActivatorServiceEvent.CONFIRMED_NAVIGATE,this._url));
            this.navigate(this._url,this._remote);
         }
         else if(param1.typeButton == param3)
         {
            dispatchEvent(new BattleLinkActivatorServiceEvent(BattleLinkActivatorServiceEvent.NOT_CONFIRMED_NAVIGATE,this._url));
            if(dialogWindowsDispatcherService.isOpen())
            {
               blurService.blur();
            }
         }
      }
      
      private function rememberShowAlertDeadBattle() : void
      {
         var _loc1_:String = userPropertyService.userName;
         storageService.getStorage().data.showAlertDeadBattle = _loc1_ + "_true";
      }
      
      public function activateLink(param1:String) : void
      {
         this.rememberShowAlertDeadBattle();
         dispatchEvent(new BattleLinkActivatorServiceEvent(BattleLinkActivatorServiceEvent.ACTIVATE_LINK,param1));
      }
      
      public function isAlive(param1:String) : void
      {
         dispatchEvent(new BattleLinkAliveEvent(BattleLinkAliveEvent.IS_ALIVE,param1));
      }
      
      public function alive(param1:String) : void
      {
         dispatchEvent(new BattleLinkAliveEvent(BattleLinkAliveEvent.ALIVE,param1));
      }
      
      public function dead(param1:String) : void
      {
         dispatchEvent(new BattleLinkAliveEvent(BattleLinkAliveEvent.DEAD,param1));
      }
   }
}

