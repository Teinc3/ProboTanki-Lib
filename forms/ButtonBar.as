package forms
{
   import §]@§.§3#D§;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   import controls.base.§2#w§;
   import controls.base.§?Y§;
   import controls.base.MainPanelBattlesButtonBase;
   import controls.base.MainPanelGarageButtonBase;
   import controls.friends.FriendsButton;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import forms.events.MainButtonBarEvents;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import services.buttonbar.IButtonBarService;
   
   public class ButtonBar extends Sprite
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var clientLog:IClientLog;
      
      [Inject]
      public static var buttonBarService:IButtonBarService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      public var battlesButton:MainPanelBattlesButton;
      
      public var garageButton:MainPanelGarageButton;
      
      public var friendsButton:FriendsButton;
      
      public var statButton:MainPaneHallButton;
      
      public var referalsButton:MainPanelReferalButton;
      
      public var bugsButton:MainPanelBugButton;
      
      public var settingsButton:MainPanelConfigButton;
      
      public var soundButton:MainPanelSoundButton;
      
      public var helpButton:MainPanelHelpButton;
      
      public var closeButton:CloseOrBackButton;
      
      public var addButton:MainPanelAccountButton;
      
      public var addButton2:§<b§;
      
      private var §?d§:§3#D§;
      
      private var _soundOn:Boolean = true;
      
      private var soundIcon:MovieClip;
      
      public var isTester:Boolean = false;
      
      public var hasDoubleCrystal:Boolean = false;
      
      public var _isFirstBattleMode:Boolean = false;
      
      public var _isNoReferalButton:Boolean = false;
      
      private var _linkMode:Array;
      
      public function ButtonBar(param1:Boolean = false, param2:Boolean = false, param3:Boolean = false, param4:Array = null)
      {
         this.battlesButton = new MainPanelBattlesButtonBase();
         this.garageButton = new MainPanelGarageButtonBase();
         this.friendsButton = new FriendsButton();
         this.statButton = new MainPaneHallButton();
         this.referalsButton = new MainPanelReferalButton();
         this.bugsButton = new MainPanelBugButton();
         this.settingsButton = new MainPanelConfigButton();
         this.soundButton = new MainPanelSoundButton();
         this.helpButton = new MainPanelHelpButton();
         this.closeButton = new CloseOrBackButton();
         this.addButton = new §2#w§();
         this.addButton2 = new §?Y§();
         this.§?d§ = new §3#D§();
         this._linkMode = new Array();
         super();
         this._isFirstBattleMode = param3;
         addChild(this.addButton);
         addChild(this.addButton2);
         this.addButton.type = 1;
         this.addButton.label = localeService.getText(TextConst.MAIN_PANEL_BUTTON_DONATE);
         this.addButton.enable = true;
         this.addButton.addEventListener(MouseEvent.CLICK,this.listClick);
         this.addButton2.type = 1;
         this.addButton2.label = localeService.getText(TextConst.MAIN_PANEL_BUTTON_DONATE);
         this.addButton2.enable = true;
         this.addButton2.addEventListener(MouseEvent.CLICK,this.listClick);
         addChild(this.battlesButton);
         this.battlesButton.type = 4;
         this.battlesButton.label = localeService.getText(TextConst.MAIN_PANEL_BUTTON_BATTLES);
         this.battlesButton.addEventListener(MouseEvent.CLICK,this.listClick);
         addChild(this.garageButton);
         this.garageButton.type = 5;
         this.garageButton.label = localeService.getText(TextConst.MAIN_PANEL_BUTTON_GARAGE);
         this.garageButton.addEventListener(MouseEvent.CLICK,this.listClick);
         addChild(this.friendsButton);
         this.§?d§.label = localeService.getText(TanksLocale.§]#i§);
         this.§?d§.type = 15;
         this.§?d§.addEventListener(MouseEvent.CLICK,this.listClick);
         addChild(this.§?d§);
         this.friendsButton.type = 14;
         this.friendsButton.label = localeService.getText(TextConst.MAIN_PANEL_BUTTON_FRIENDS);
         this.friendsButton.addEventListener(MouseEvent.CLICK,this.listClick);
         this.statButton.type = 4;
         this.statButton.label = localeService.getText(TextConst.MAIN_PANEL_BUTTON_HALL);
         this.statButton.addEventListener(MouseEvent.CLICK,this.listClick);
         addChild(this.referalsButton);
         this.referalsButton.type = 13;
         this.referalsButton.addEventListener(MouseEvent.CLICK,this.listClick);
         addChild(this.bugsButton);
         this.bugsButton.type = 9;
         this.bugsButton.addEventListener(MouseEvent.CLICK,this.listClick);
         addChild(this.settingsButton);
         this.settingsButton.type = 7;
         this.settingsButton.addEventListener(MouseEvent.CLICK,this.listClick);
         addChild(this.soundButton);
         this.soundButton.type = 8;
         this.soundButton.addEventListener(MouseEvent.CLICK,this.listClick);
         this.soundIcon = this.soundButton.getChildByName("icon") as MovieClip;
         addChild(this.helpButton);
         this.helpButton.type = 9;
         this.helpButton.addEventListener(MouseEvent.CLICK,this.listClick);
         addChild(this.closeButton);
         this.closeButton.addEventListener(MouseEvent.CLICK,this.listClick);
         if(this._isFirstBattleMode)
         {
            this.addButton.visible = false;
            this.addButton2.visible = false;
            this.battlesButton.visible = false;
            this.garageButton.visible = false;
            this.friendsButton.visible = false;
            this.referalsButton.visible = false;
            this.bugsButton.visible = false;
            this.settingsButton.visible = false;
         }
         else
         {
            this.referalsButton.visible = !this._isNoReferalButton;
         }
         this.draw();
      }
      
      public function setEnablePaymentButton(param1:Boolean) : void
      {
         this.addButton.enable = param1;
         this.addButton2.enable = param1;
      }
      
      public function draw() : void
      {
         this.§?d§.visible = this.§!#T§();
         this.§?d§.x = this.addButton.x + this.addButton.width + 7;
         this.friendsButton.x = this.§?d§.x + (this.§?d§.visible ? this.§?d§.width : 0);
         this.battlesButton.x = this.friendsButton.x + this.friendsButton.width;
         this.garageButton.x = this.battlesButton.x + this.battlesButton.width;
         this.referalsButton.x = this.garageButton.x + this.garageButton.width + 6;
         var _loc1_:Boolean = false;
         this.referalsButton.x = this.garageButton.x + this.garageButton.width + (_loc1_ ? 86 : 6);
         this.bugsButton.visible = this.isTester;
         if(this._isNoReferalButton)
         {
            if(!this.isTester)
            {
               this.bugsButton.x = this.referalsButton.x;
               this.settingsButton.x = this.bugsButton.x + this.bugsButton.width;
            }
            else
            {
               this.settingsButton.x = this.referalsButton.x;
            }
         }
         else if(this.isTester)
         {
            this.bugsButton.x = this.referalsButton.x + this.referalsButton.width;
            this.settingsButton.x = this.bugsButton.x + this.bugsButton.width;
         }
         else
         {
            this.settingsButton.x = this.referalsButton.x + this.referalsButton.width;
         }
         this.soundButton.x = this.settingsButton.x + this.settingsButton.width;
         this.helpButton.x = this.soundButton.x + this.soundButton.width;
         this.closeButton.x = this.helpButton.x + this.helpButton.width + 11;
         this.addButton.visible = !this.hasDoubleCrystal && !this._isFirstBattleMode;
         this.addButton2.visible = this.hasDoubleCrystal && !this._isFirstBattleMode;
         this.soundIcon.gotoAndStop(this.soundOn ? 1 : 2);
      }
      
      public function §!#T§() : Boolean
      {
         return userPropertiesService.rank >= 4;
      }
      
      public function set soundOn(param1:Boolean) : void
      {
         this._soundOn = param1;
         this.draw();
      }
      
      public function get soundOn() : Boolean
      {
         return this._soundOn;
      }
      
      private function listClick(param1:MouseEvent) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Object = null;
         var _loc4_:int = 0;
         _loc2_ = param1.currentTarget;
         if(_loc2_.enable)
         {
            dispatchEvent(new MainButtonBarEvents(_loc2_.type));
            buttonBarService.change(_loc2_.type);
         }
         if(_loc2_ == this.soundButton)
         {
            this.soundOn = !this.soundOn;
         }
      }
   }
}

