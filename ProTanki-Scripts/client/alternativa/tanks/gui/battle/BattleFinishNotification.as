package alternativa.tanks.gui.battle
{
   import alternativa.osgi.service.locale.ILocaleService;
   import assets.Diamond;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import flash.events.MouseEvent;
   import flash.text.TextLineMetrics;
   import forms.ColorConstants;
   import projects.tanks.clients.flash.commons.services.notification.Notification;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class BattleFinishNotification extends Notification
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      private static const DEFAULT_BUTTON_WIDTH:int = 96;
      
      private var _messageLabel:LabelBase;
      
      private var _rejectButton:DefaultButtonBase;
      
      private var _diamond:Diamond;
      
      public function BattleFinishNotification()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         this._messageLabel = new LabelBase();
         this._messageLabel.color = ColorConstants.GREEN_LABEL;
         this._messageLabel.mouseEnabled = false;
         addChild(this._messageLabel);
         this._messageLabel.htmlText = message;
         this._diamond = new Diamond();
         addChild(this._diamond);
         this._rejectButton = new DefaultButtonBase();
         this._rejectButton.width = DEFAULT_BUTTON_WIDTH;
         this._rejectButton.label = localeService.getText(TanksLocale.TEXT_CLOSE_LABEL);
         addChild(this._rejectButton);
         autoClosable = false;
      }
      
      override protected function setEvents() : void
      {
         super.setEvents();
         this._rejectButton.addEventListener(MouseEvent.CLICK,this.onRejectClick);
      }
      
      override protected function removeEvents() : void
      {
         super.removeEvents();
         this._rejectButton.removeEventListener(MouseEvent.CLICK,this.onRejectClick);
      }
      
      private function onRejectClick(param1:MouseEvent) : void
      {
         this.closeNotification();
      }
      
      override protected function closeNotification() : void
      {
         hide();
      }
      
      override protected function resize() : void
      {
         this._messageLabel.x = GAP + 9;
         this._messageLabel.y = GAP + 7;
         var _loc1_:TextLineMetrics = this._messageLabel.getLineMetrics(this._messageLabel.numLines - 1);
         this._diamond.x = int(this._messageLabel.x + _loc1_.width + 5);
         this._diamond.y = this._messageLabel.y + this._messageLabel.height - 14;
         _innerHeight = this._messageLabel.y + this._messageLabel.height - 3;
         var _loc2_:int = this._messageLabel.x + this._messageLabel.width + GAP * 2;
         if(_loc2_ > _width)
         {
            _width = _loc2_;
         }
         this._rejectButton.x = _width - this._rejectButton.width - GAP;
         this._rejectButton.y = _innerHeight + 16;
         _height = this._rejectButton.y + this._rejectButton.height + GAP + 1;
         super.resize();
      }
      
      protected function getRewardText(param1:int, param2:int) : String
      {
         var _loc3_:* = String(param1);
         if(param2 > 0)
         {
            _loc3_ = "<font color=\"#f3c800\">" + String(param1 + param2) + "</font>";
         }
         return _loc3_;
      }
   }
}

