package alternativa.tanks.model.panel
{
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.startup.StartupSettings;
   import alternativa.tanks.gui.SettingsWindow;
   import alternativa.tanks.help.ButtonBarHelper;
   import alternativa.tanks.help.FriendsHelper;
   import alternativa.tanks.help.IHelpService;
   import alternativa.tanks.help.MainMenuHelper;
   import alternativa.tanks.help.MoneyHelper;
   import alternativa.tanks.help.RankBarHelper;
   import alternativa.tanks.help.RankHelper;
   import alternativa.tanks.help.RatingIndicatorHelper;
   import alternativa.tanks.help.ScoreHelper;
   import alternativa.tanks.model.shop.ShopModel;
   import alternativa.tanks.service.achievement.IAchievementService;
   import alternativa.tanks.service.fps.§ v§;
   import alternativa.tanks.service.fps.FPSService;
   import alternativa.tanks.service.money.IMoneyService;
   import alternativa.tanks.service.panel.IPanelView;
   import §break set function§.§'!`§;
   import §break set function§.§1# §;
   import controls.RedButton;
   import controls.base.DefaultButtonBase;
   import controls.buttons.h30px.GreenMediumButton;
   import flash.display.Sprite;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.net.SharedObject;
   import flash.system.Capabilities;
   import flash.utils.Timer;
   import forms.MainPanel;
   import forms.ServerRedirectAlert;
   import forms.ServerStopAlert;
   import forms.events.AlertEvent;
   import forms.events.MainButtonBarEvents;
   import projects.tanks.client.commons.models.layout.LayoutState;
   import projects.tanks.clients.flash.commons.services.layout.LobbyLayoutServiceEvent;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.AlertServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.BattleInfoServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.AlertUtils;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.KeyUpListenerPriority;
   import scpacker.networking.Network;
   import services.alertservice.Alert;
   import services.alertservice.§get const use§;
   
   public class PanelModel extends §1# § implements §'!`§
   {
      [Inject]
      public static var panelView:IPanelView;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var helpService:IHelpService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      [Inject]
      public static var achievementService:IAchievementService;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var alertService:IAlertService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private static const HELPER_GROUP_KEY:String = "PanelModel";
      
      public static const KEYCODE_F11:uint = 122;
      
      public static const DISPLAY_STATE_FULL_SCREEN_INTERACTIVE:String = "fullScreenInteractive";
      
      public static const DISPLAY_STATE_NORMAL:String = "normal";
      
      private static const GA_CATEGORY:String = "lobby";
      
      private var storage:SharedObject;
      
      private var clientObject:ClientObject;
      
      private var panel:MainPanel;
      
      private var §@!;§:String;
      
      private var settingsWindow:SettingsWindow;
      
      private var shopModel:ShopModel;
      
      private var emailConfirmed:Boolean;
      
      private const HELPER_RANK:int = 1;
      
      private const HELPER_RANK_BAR:int = 2;
      
      private const HELPER_RATING_INDICATOR:int = 3;
      
      private const HELPER_MAIN_MENU:int = 5;
      
      private const HELPER_BUTTON_BAR:int = 6;
      
      private const HELPER_MONEY:int = 7;
      
      private const HELPER_SCORE:int = 10;
      
      private const HELPER_FRIENDS:int = 11;
      
      private var stopAlert:ServerStopAlert;
      
      private var email:String;
      
      private var showRedirectAlertTimer:Timer;
      
      private var redirectAlert:ServerRedirectAlert;
      
      private var serverToRedirectTo:String;
      
      private var networker:Network;
      
      public function PanelModel()
      {
         this.shopModel = new ShopModel();
         super();
      }
      
      private static function closeButtonPressed() : void
      {
         var _loc1_:LayoutState = null;
         if(lobbyLayoutService.inBattle())
         {
            _loc1_ = lobbyLayoutService.getCurrentState();
            if(_loc1_ == LayoutState.BATTLE_SELECT)
            {
               lobbyLayoutService.showBattleSelect();
            }
            else if(_loc1_ == LayoutState.GARAGE)
            {
               lobbyLayoutService.showGarage();
            }
            else if(_loc1_ != LayoutState.PAYMENT)
            {
               lobbyLayoutService.exitFromBattle();
            }
         }
         else
         {
            lobbyLayoutService.exitFromGame();
         }
      }
      
      private static function onKeyUp(param1:KeyboardEvent) : void
      {
         if(AlertUtils.isCancelKey(param1.keyCode) && !lobbyLayoutService.isSwitchInProgress())
         {
            param1.stopImmediatePropagation();
            closeButtonPressed();
         }
      }
      
      public static function switchPayment() : void
      {
         var _loc1_:* = lobbyLayoutService.getCurrentState() == LayoutState.PAYMENT;
         if(_loc1_)
         {
            lobbyLayoutService.showPayment();
         }
         else
         {
            lobbyLayoutService.§for const const§();
         }
      }
      
      public function objectLoaded() : void
      {
         panelView.§break const const§(true,false,false,false,true);
         this.panel = panelView.§+#,§();
         this.showPanel();
         this.addListeners();
         this.updateNavigationLock(null);
         lobbyLayoutService.addEventListener(LobbyLayoutServiceEvent.BEGIN_LAYOUT_SWITCH,this.updateNavigationLock);
         lobbyLayoutService.addEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,this.updateNavigationLock);
         § v§(OSGi.getInstance().getService(FPSService)).start();
      }
      
      public function objectLoadedPost() : void
      {
         achievementService.setGarageBuyButtonTargetPoint(new Point(0,0));
         this.§[5§();
         display.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKey);
      }
      
      private function §[5§() : void
      {
         var _loc1_:Boolean = Boolean(this.panel.buttonBar.§!#T§());
         var _loc2_:int = 465 + 13 * 2 + 110 + 60;
         var _loc3_:RankBarHelper = new RankBarHelper(0.5,_loc2_,60);
         var _loc4_:RatingIndicatorHelper = new RatingIndicatorHelper(1,_loc2_,75 - (_loc1_ ? 180 : 90));
         var _loc5_:MainMenuHelper = new MainMenuHelper(1,_loc2_,60 + 110 + 13 * 2 + 140 + 6);
         var _loc6_:MoneyHelper = new MoneyHelper(1,_loc2_,_loc1_ ? 100 : 165);
         var _loc7_:ScoreHelper = new ScoreHelper();
         var _loc8_:RankHelper = new RankHelper();
         var _loc9_:FriendsHelper = new FriendsHelper(1,_loc2_,60 + 110 + 13 * 2 + 140 - 90);
         var _loc11_:Boolean;
         var _loc12_:Boolean = _loc11_ = true;
         var _loc13_:ButtonBarHelper = new ButtonBarHelper(1,45,-4,_loc12_);
         helpService.registerHelper(HELPER_GROUP_KEY,this.HELPER_RANK,_loc8_,true);
         helpService.registerHelper(HELPER_GROUP_KEY,this.HELPER_RANK_BAR,_loc3_,true);
         helpService.registerHelper(HELPER_GROUP_KEY,this.HELPER_SCORE,_loc7_,true);
         helpService.registerHelper(HELPER_GROUP_KEY,this.HELPER_RATING_INDICATOR,_loc4_,true);
         helpService.registerHelper(HELPER_GROUP_KEY,this.HELPER_MAIN_MENU,_loc5_,true);
         helpService.registerHelper(HELPER_GROUP_KEY,this.HELPER_BUTTON_BAR,_loc13_,true);
         helpService.registerHelper(HELPER_GROUP_KEY,this.HELPER_MONEY,_loc6_,true);
         helpService.registerHelper(HELPER_GROUP_KEY,this.HELPER_FRIENDS,_loc9_,true);
      }
      
      private function addListeners() : void
      {
         this.panel.buttonBar.addEventListener(MainButtonBarEvents.PANEL_BUTTON_PRESSED,this.onButtonBarButtonClick);
         battleInfoService.addEventListener(BattleInfoServiceEvent.BATTLE_UNLOAD,this.onBattleUnload);
         battleInfoService.addEventListener(BattleInfoServiceEvent.BATTLE_LOAD,this.onBattleLoad);
         display.stage.addEventListener(KeyboardEvent.KEY_UP,onKeyUp,false,KeyUpListenerPriority.PANEL);
      }
      
      private function onKey(param1:KeyboardEvent) : void
      {
         var _loc2_:Array = null;
         if(param1.keyCode == KEYCODE_F11)
         {
            _loc2_ = Capabilities.version.substr(Capabilities.version.indexOf(" ") + 1).split(",");
            if(int(_loc2_[0]) == 11 && int(_loc2_[1]) >= 3 || int(_loc2_[0]) > 11)
            {
               if(display.stage.displayState == DISPLAY_STATE_NORMAL)
               {
                  display.stage.displayState = DISPLAY_STATE_FULL_SCREEN_INTERACTIVE;
               }
               else
               {
                  display.stage.displayState = DISPLAY_STATE_NORMAL;
               }
            }
         }
      }
      
      private function updateNavigationLock(param1:LobbyLayoutServiceEvent) : void
      {
         if(lobbyLayoutService.isSwitchInProgress())
         {
            this.lockMainPanel();
         }
         else
         {
            this.unlockMainPanel();
         }
         var _loc2_:LayoutState = lobbyLayoutService.getCurrentState();
         this.setButtonState(_loc2_);
      }
      
      private function onBattleLoad(param1:BattleInfoServiceEvent) : void
      {
         lobbyLayoutService.addEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,this.onEndLayoutSwitchInBattle);
         this.panel.buttonBar.closeButton.show();
      }
      
      private function onBattleUnload(param1:BattleInfoServiceEvent) : void
      {
         lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,this.onEndLayoutSwitchInBattle);
         this.panel.buttonBar.closeButton.changeOnCloseButton();
      }
      
      private function onEndLayoutSwitchInBattle(param1:LobbyLayoutServiceEvent) : void
      {
         if(param1.state == LayoutState.BATTLE)
         {
            this.panel.buttonBar.closeButton.changeOnCloseButton();
         }
         else
         {
            this.panel.buttonBar.closeButton.changeOnBackButton();
         }
      }
      
      private function lockMainPanel() : void
      {
         this.panel.mouseEnabled = false;
         this.panel.mouseChildren = false;
      }
      
      private function unlockMainPanel() : void
      {
         this.panel.mouseEnabled = true;
         this.panel.mouseChildren = true;
      }
      
      private function setButtonState(param1:LayoutState, param2:Boolean = true) : void
      {
         switch(param1)
         {
            case LayoutState.BATTLE:
               this.panel.buttonBar.setEnablePaymentButton(true);
               this.panel.buttonBar.battlesButton.enable = true;
               this.panel.buttonBar.garageButton.enable = true;
               break;
            case LayoutState.BATTLE_SELECT:
               this.panel.buttonBar.setEnablePaymentButton(true);
               this.panel.buttonBar.battlesButton.enable = false;
               this.panel.buttonBar.garageButton.enable = true;
               break;
            case LayoutState.GARAGE:
               this.panel.buttonBar.setEnablePaymentButton(true);
               this.panel.buttonBar.garageButton.enable = false;
               this.panel.buttonBar.battlesButton.enable = true;
         }
      }
      
      public function objectUnloaded() : void
      {
         lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.BEGIN_LAYOUT_SWITCH,this.updateNavigationLock);
         lobbyLayoutService.removeEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,this.updateNavigationLock);
         achievementService.hideAllBubbles(false);
         this.hidePanel();
         display.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKey);
         display.stage.removeEventListener(KeyboardEvent.KEY_UP,onKeyUp);
         helpService.hideHelp();
         helpService.unregisterHelper(HELPER_GROUP_KEY,this.HELPER_RANK);
         helpService.unregisterHelper(HELPER_GROUP_KEY,this.HELPER_RANK_BAR);
         helpService.unregisterHelper(HELPER_GROUP_KEY,this.HELPER_RATING_INDICATOR);
         helpService.unregisterHelper(HELPER_GROUP_KEY,this.HELPER_MAIN_MENU);
         helpService.unregisterHelper(HELPER_GROUP_KEY,this.HELPER_BUTTON_BAR);
         helpService.unregisterHelper(HELPER_GROUP_KEY,this.HELPER_MONEY);
         helpService.unregisterHelper(HELPER_GROUP_KEY,this.HELPER_SCORE);
         OSGi.getInstance().unregisterService(IMoneyService);
      }
      
      public function showMessage(param1:ClientObject, param2:String) : void
      {
         this._showMessage(param2);
      }
      
      public function _showMessage(param1:String) : void
      {
         var _loc2_:Alert = new Alert();
         _loc2_.showAlert(param1,Vector.<String>([§get const use§.OK]));
      }
      
      private function showPanel() : void
      {
         display.systemUILayer.addChild(this.panel);
      }
      
      private function hidePanel() : void
      {
         this.panel.hide();
         if(display.systemUILayer.contains(this.panel))
         {
            display.systemUILayer.removeChild(this.panel);
         }
         this.panel.buttonBar.removeEventListener(MainButtonBarEvents.PANEL_BUTTON_PRESSED,this.onButtonBarButtonClick);
      }
      
      private function onButtonBarButtonClick(param1:MainButtonBarEvents) : void
      {
         achievementService.hideAllBubbles(false);
         this.§@!;§ = param1.typeButton;
         if(Boolean(lobbyLayoutService.inBattle()) && this.§static const each§(param1.typeButton) && !lobbyLayoutService.isWindowOpenOverBattle())
         {
            this.§throw package get§();
         }
         else
         {
            this.changeState();
         }
      }
      
      private function §static const each§(param1:String) : Boolean
      {
         return [MainButtonBarEvents.BATTLE,MainButtonBarEvents.GARAGE].indexOf(param1) >= 0;
      }
      
      private function §throw package get§() : void
      {
         var _loc1_:String = this.§use set case§();
         var _loc2_:Vector.<Sprite> = new Vector.<Sprite>();
         var _loc3_:* = new GreenMediumButton();
         _loc3_.label = §get const use§.YES;
         _loc2_.push(_loc3_);
         var _loc4_:*;
         (_loc4_ = new RedButton()).label = §get const use§.NO;
         _loc2_.push(_loc4_);
         var _loc5_:*;
         (_loc5_ = new DefaultButtonBase()).label = §get const use§.CANCEL;
         _loc2_.push(_loc5_);
         alertService.§switch const true§(_loc1_,Vector.<String>([§get const use§.YES,§get const use§.NO,§get const use§.CANCEL]),_loc2_);
         alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onQuitBattleDialogButtonPressed);
      }
      
      private function §use set case§() : String
      {
         return localeService.getText(TanksLocale.TEXT_ALERT_STAY_IN_BATTLE);
      }
      
      private function onQuitBattleDialogButtonPressed(param1:AlertServiceEvent) : void
      {
         alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onQuitBattleDialogButtonPressed);
         switch(param1.typeButton)
         {
            case §get const use§.CANCEL:
               this.setButtonState(LayoutState.BATTLE);
               break;
            case §get const use§.NO:
               lobbyLayoutService.exitFromBattleToState(this.§catch set for§());
               break;
            case §get const use§.YES:
               this.changeState();
         }
      }
      
      private function §catch set for§() : LayoutState
      {
         switch(this.§@!;§)
         {
            case MainButtonBarEvents.GARAGE:
               return LayoutState.GARAGE;
            default:
               return LayoutState.BATTLE_SELECT;
         }
      }
      
      private function changeState() : void
      {
         switch(this.§@!;§)
         {
            case MainButtonBarEvents.BATTLE:
               lobbyLayoutService.showBattleSelect();
               break;
            case MainButtonBarEvents.CLOSE:
               closeButtonPressed();
               break;
            case MainButtonBarEvents.GARAGE:
               lobbyLayoutService.showGarage();
               break;
            case MainButtonBarEvents.HELP:
               this.showHelpers();
               break;
            case MainButtonBarEvents.ADDMONEY:
               switchPayment();
         }
      }
      
      private function showHelpers() : void
      {
         helpService.showHelp();
         panelView.unlock();
      }
      
      private function showQuitDialog() : void
      {
         var _loc1_:Alert = new Alert(Alert.ALERT_QUIT);
         display.dialogsLayer.addChild(_loc1_);
         _loc1_.addEventListener(AlertEvent.ALERT_BUTTON_PRESSED,this.onAlertButtonPressed);
      }
      
      private function hideHelp(param1:MouseEvent) : void
      {
         display.stage.removeEventListener(MouseEvent.MOUSE_DOWN,this.hideHelp);
      }
      
      private function onAlertButtonPressed(param1:AlertEvent) : void
      {
         if(param1.typeButton == §get const use§.YES)
         {
            StartupSettings.closeApplication();
            IStorageService(OSGi.getInstance().getService(IStorageService)).getStorage().data.userHash = null;
            IStorageService(OSGi.getInstance().getService(IStorageService)).getStorage().flush();
         }
      }
   }
}

