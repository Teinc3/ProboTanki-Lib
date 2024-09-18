package projects.tanks.clients.flash.commons.services.layout
{
   import Renamed193.Renamed4455;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.startup.StartupSettings;
   import alternativa.tanks.locale.constants.TextConst;
   import flash.events.EventDispatcher;
   import flash.external.ExternalInterface;
   import flash.net.SharedObject;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.clients.fp10.libraries.alternativapartners.service.IPartnerService;
   import projects.tanks.client.commons.models.layout.LayoutState;
   import projects.tanks.clients.flash.commons.models.layout.ILobbyLayout;
   import projects.tanks.clients.flash.commons.models.layout.notify.ILobbyLayoutNotify;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.AlertServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.IDialogWindowsDispatcherService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   import services.alertservice.Alert;
   import services.alertservice.Renamed1616;
   
   public class LobbyLayoutService extends EventDispatcher implements ILobbyLayoutService
   {
      [Inject]
      public static var alertService:IAlertService;
      
      [Inject]
      public static var storageService:IStorageService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var dialogWindowsDispatcherService:IDialogWindowsDispatcherService;
      
      [Inject]
      public static var partnersService:IPartnerService;
      
      [Inject]
      public static var userInfoService:IUserInfoService;
      
      [Inject]
      public static var modelRegistry:ModelRegistry;
      
      private var _disablePayment:Boolean;
      
      private var battleReady:Boolean;
      
      public function LobbyLayoutService()
      {
         super();
      }
      
      private static function showExitFromGameAlert() : void
      {
         alertService.showAlertById(Alert.ALERT_QUIT);
         alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,onQuitGameDialogButtonPressed);
      }
      
      private static function onQuitGameDialogButtonPressed(param1:AlertServiceEvent) : void
      {
         alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,onQuitGameDialogButtonPressed);
         if(param1.typeButton == Renamed1616.YES)
         {
            clearHash();
            if(ExternalInterface.available)
            {
               ExternalInterface.call("goToMainPage");
            }
            StartupSettings.closeApplication();
         }
      }
      
      private static function clearHash() : void
      {
         var _loc1_:SharedObject = storageService.getStorage();
         _loc1_.data.userHash = null;
         _loc1_.flush();
      }
      
      public function showGarage() : void
      {
         this.layoutSwitchPredicted();
         ILobbyLayout(modelRegistry.getModelsByInterface(ILobbyLayout)[0]).switchGarage();
      }
      
      public function showBattleSelect() : void
      {
         this.layoutSwitchPredicted();
         ILobbyLayout(modelRegistry.getModelsByInterface(ILobbyLayout)[0]).switchBattleSelect();
      }
      
      public function Renamed2158() : void
      {
         dispatchEvent(new Renamed4455(Renamed4455.SWITCH_STARTED));
      }
      
      public function showPayment() : void
      {
         ILobbyLayout(modelRegistry.getModelsByInterface(ILobbyLayout)[0]).switchPayment();
      }
      
      public function isSwitchInProgress() : Boolean
      {
         return ILobbyLayoutNotify(modelRegistry.getModelsByInterface(ILobbyLayoutNotify)[0]).isSwitchInProgress();
      }
      
      public function getCurrentState() : LayoutState
      {
         return ILobbyLayoutNotify(modelRegistry.getModelsByInterface(ILobbyLayoutNotify)[0]).getCurrentState();
      }
      
      public function Renamed4456() : void
      {
         if(this.getCurrentState() == LayoutState.BATTLE_SELECT)
         {
            this.showBattleSelect();
         }
         else if(this.getCurrentState() == LayoutState.GARAGE)
         {
            this.showGarage();
         }
      }
      
      public function exitFromBattle() : void
      {
         if(battleInfoService.isSpectatorMode())
         {
            this.exitFromBattleWithoutNotify();
         }
         else
         {
            this.showExitFromBattleAlert();
         }
      }
      
      private function showExitFromBattleAlert() : void
      {
         var _loc1_:String = this.getTextForExitFromBattleAlert();
         alertService.showAlert(_loc1_,Vector.<String>([localeService.getText(TextConst.ALERT_ANSWER_YES),localeService.getText(TextConst.ALERT_ANSWER_NO)]));
         alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onQuitBattleDialogButtonPressed);
      }
      
      private function getTextForExitFromBattleAlert() : String
      {
         return localeService.getText(TanksLocale.TEXT_FRIENDS_EXIT_FROM_BATTLE_ALERT);
      }
      
      private function onQuitBattleDialogButtonPressed(param1:AlertServiceEvent) : void
      {
         alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onQuitBattleDialogButtonPressed);
         if(param1.typeButton == localeService.getText(TextConst.ALERT_ANSWER_YES))
         {
            this.exitFromBattleWithoutNotify();
         }
      }
      
      public function exitFromBattleWithoutNotify() : void
      {
         ILobbyLayout(modelRegistry.getModelsByInterface(ILobbyLayout)[0]).exitFromBattle();
      }
      
      public function exitFromBattleToState(param1:LayoutState) : void
      {
         this.layoutSwitchPredicted();
         ILobbyLayout(modelRegistry.getModelsByInterface(ILobbyLayout)[0]).exitFromBattleToState(param1);
      }
      
      public function exitFromGame() : void
      {
         showExitFromGameAlert();
      }
      
      public function get paymentDisabled() : Boolean
      {
         return this._disablePayment;
      }
      
      public function set disablePayment(param1:Boolean) : void
      {
         this._disablePayment = param1;
      }
      
      public function layoutSwitchPredicted() : void
      {
         ILobbyLayoutNotify(modelRegistry.getModelsByInterface(ILobbyLayoutNotify)[0]).layoutSwitchPredicted();
      }
      
      public function inBattle() : Boolean
      {
         return ILobbyLayoutNotify(modelRegistry.getModelsByInterface(ILobbyLayoutNotify)[0]).inBattle();
      }
      
      public function isWindowOpenOverBattle() : Boolean
      {
         return this.inBattle() && (this.getCurrentState() != LayoutState.BATTLE || dialogWindowsDispatcherService.isOpen());
      }
      
      private function isOpenPopupOverBattle() : Boolean
      {
         return this.inBattle() && this.getCurrentState() != LayoutState.BATTLE;
      }
      
      public function closePopupOverBattle() : void
      {
         var _loc1_:LayoutState = null;
         if(!this.isSwitchInProgress() && this.isOpenPopupOverBattle())
         {
            _loc1_ = this.getCurrentState();
            if(_loc1_ == LayoutState.BATTLE_SELECT)
            {
               this.showBattleSelect();
            }
            else if(_loc1_ == LayoutState.GARAGE)
            {
               this.showGarage();
            }
            else if(_loc1_ == LayoutState.PAYMENT)
            {
            }
         }
      }
      
      public function setBattleReady(param1:Boolean) : void
      {
         this.battleReady = param1;
      }
      
      public function isBattleReady() : Boolean
      {
         return this.battleReady;
      }
   }
}

