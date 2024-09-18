package alternativa.tanks.gui.friends.battleinvite
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   import assets.cellrenderer.battlelist.PaydIcon;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.text.TextLineMetrics;
   import forms.ColorConstants;
   import forms.userlabel.UserLabel;
   import org.osflash.signals.Signal;
   import projects.tanks.clients.flash.commons.services.notification.Notification;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.battleinvite.IBattleInviteService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import services.alertservice.§get const use§;
   
   public class BattleInviteNotification extends Notification
   {
      [Inject]
      public static var battleInviteService:IBattleInviteService;
      
      [Inject]
      public static var battleAlertService:IAlertService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var storageService:IStorageService;
      
      private static const DEFAULT_BUTTON_WIDTH:int = 96;
      
      private static const SHOW_ALERT_ABOUT_INACCESSIBLE_IN_STANDALONE:String = "SHOW_ALERT_ABOUT_INACCESSIBLE_IN_STANDALONE";
      
      private var _userLabel:UserLabel;
      
      private var _battleId:String;
      
      private var _battleUrl:String;
      
      private var _isRemoteBattleUrl:Boolean;
      
      private var _baseMessageLabel:LabelBase;
      
      private var _mapAndServerNumberMessageLabel:LabelBase;
      
      private var _rejectButton:DefaultButtonBase;
      
      private var _acceptButton:DefaultButtonBase;
      
      private var _inaccessibleInStandalone:Boolean;
      
      private var _noSuppliesBattle:Boolean;
      
      private var _mapAndServerNumberString:String;
      
      private var _noSuppliesIcon:PaydIcon;
      
      public function BattleInviteNotification(param1:String, param2:String, param3:String, param4:String, param5:Boolean, param6:String, param7:Boolean)
      {
         this._battleId = param3;
         this._battleUrl = param4;
         this._isRemoteBattleUrl = param5;
         this._noSuppliesBattle = param7;
         this._mapAndServerNumberString = param6;
         super(param1,param2);
      }
      
      private static function isShowAlertAboutInaccessibleInStandalone() : Boolean
      {
         var _loc1_:* = storageService.getStorage().data[SHOW_ALERT_ABOUT_INACCESSIBLE_IN_STANDALONE];
         return _loc1_ != undefined;
      }
      
      private static function markAsShowAlertAboutInaccessibleInStandalone() : void
      {
         storageService.getStorage().data[SHOW_ALERT_ABOUT_INACCESSIBLE_IN_STANDALONE] = true;
         storageService.getStorage().flush();
      }
      
      override protected function init() : void
      {
         super.init();
         this._inaccessibleInStandalone = this._isRemoteBattleUrl && !ExternalInterface.available;
         this._userLabel = new UserLabel(userId);
         addChild(this._userLabel);
         this._baseMessageLabel = new LabelBase();
         this._baseMessageLabel.color = ColorConstants.GREEN_LABEL;
         this._baseMessageLabel.mouseEnabled = false;
         addChild(this._baseMessageLabel);
         this._baseMessageLabel.htmlText = message;
         this._mapAndServerNumberMessageLabel = new LabelBase();
         this._mapAndServerNumberMessageLabel.color = ColorConstants.GREEN_LABEL;
         this._mapAndServerNumberMessageLabel.mouseEnabled = false;
         addChild(this._mapAndServerNumberMessageLabel);
         this._mapAndServerNumberMessageLabel.htmlText = this._mapAndServerNumberString;
         if(this._noSuppliesBattle)
         {
            this._noSuppliesIcon = new PaydIcon();
            this._noSuppliesIcon.gotoAndStop(1);
            addChild(this._noSuppliesIcon);
         }
         this._acceptButton = new DefaultButtonBase();
         this._acceptButton.width = DEFAULT_BUTTON_WIDTH;
         this._acceptButton.label = localeService.getText(TextConst.STRING_GO_TO_BATTLE_LABEL);
         addChild(this._acceptButton);
         this._rejectButton = new DefaultButtonBase();
         this._rejectButton.width = DEFAULT_BUTTON_WIDTH;
         this._rejectButton.label = localeService.getText(TextConst.STRING_DECLINE_LABEL);
         addChild(this._rejectButton);
         this._acceptButton.visible = !this._inaccessibleInStandalone;
         this._rejectButton.visible = !this._inaccessibleInStandalone;
      }
      
      override protected function setEvents() : void
      {
         super.setEvents();
         this._acceptButton.addEventListener(MouseEvent.CLICK,this.onAcceptClick);
         this._rejectButton.addEventListener(MouseEvent.CLICK,this.onRejectClick);
      }
      
      override protected function removeEvents() : void
      {
         super.removeEvents();
         this._acceptButton.removeEventListener(MouseEvent.CLICK,this.onAcceptClick);
         this._rejectButton.removeEventListener(MouseEvent.CLICK,this.onRejectClick);
      }
      
      private function onAcceptClick(param1:MouseEvent) : void
      {
         battleInviteService.accept(userId,this._battleId,this._battleUrl,this._isRemoteBattleUrl);
         hide();
      }
      
      private function onRejectClick(param1:MouseEvent) : void
      {
         this.closeNotification();
      }
      
      override protected function closeNotification() : void
      {
         battleInviteService.reject(userId);
         if(this._inaccessibleInStandalone && !isShowAlertAboutInaccessibleInStandalone())
         {
            battleAlertService.showAlert(localeService.getText(TextConst.STRING_YOUR_ARE_PLAING_SAFP_ALERT),Vector.<String>([localeService.getText(§get const use§.OK)]));
            markAsShowAlertAboutInaccessibleInStandalone();
         }
         hide();
      }
      
      override public function show(param1:Signal) : void
      {
         super.show(param1);
         battleInviteService.playNotificationSound();
      }
      
      override protected function resize() : void
      {
         var _loc2_:TextLineMetrics = null;
         var _loc1_:int = 0;
         this._userLabel.x = GAP + 7;
         this._userLabel.y = GAP + 5;
         this._baseMessageLabel.x = GAP + 9;
         this._baseMessageLabel.y = this._userLabel.y + this._userLabel.height - 1;
         this._mapAndServerNumberMessageLabel.x = GAP + 9;
         _loc2_ = this._baseMessageLabel.getLineMetrics(0);
         if(this._noSuppliesBattle)
         {
            this._noSuppliesIcon.x = GAP + 12;
            this._noSuppliesIcon.y = this._baseMessageLabel.y + _loc2_.height + 3;
            this._mapAndServerNumberMessageLabel.x = this._noSuppliesIcon.x + this._noSuppliesIcon.width + 2;
         }
         this._mapAndServerNumberMessageLabel.y = this._baseMessageLabel.y + _loc2_.height;
         _innerHeight = this._baseMessageLabel.y + this._baseMessageLabel.height - 3;
         var _loc3_:int = this._baseMessageLabel.x + this._baseMessageLabel.width + GAP * 2;
         if(_loc3_ > _width)
         {
            _width = _loc3_;
         }
         if(this._inaccessibleInStandalone)
         {
            _height = _innerHeight + GAP * 2 + 1;
         }
         else
         {
            _loc1_ = _innerHeight + 16;
            this._acceptButton.x = GAP;
            this._acceptButton.y = _loc1_;
            this._rejectButton.x = _width - this._rejectButton.width - GAP;
            this._rejectButton.y = _loc1_;
            _height = this._acceptButton.y + this._acceptButton.height + GAP + 1;
         }
         super.resize();
      }
   }
}

