package services.alertservice
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import controls.ColorButton;
   import controls.TankWindow;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import controls.buttons.ButtonBase;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import forms.events.AlertEvent;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.AlertUtils;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.KeyUpListenerPriority;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.removeDisplayObject;
   
   public class Alert extends Sprite
   {
      public static const ALERT_QUIT:int = 0;
      
      public static const ALERT_CONFIRM_EMAIL:int = 1;
      
      public static const ERROR_CALLSIGN_FIRST_SYMBOL:int = 2;
      
      public static const ERROR_CALLSIGN_DEVIDE:int = 3;
      
      public static const ERROR_CALLSIGN_LAST_SYMBOL:int = 4;
      
      public static const ERROR_CALLSIGN_LENGTH:int = 5;
      
      public static const ERROR_CALLSIGN_UNIQUE:int = 6;
      
      public static const ERROR_PASSWORD_LENGTH:int = 7;
      
      public static const ERROR_PASSWORD_INCORRECT:int = 8;
      
      public static const ERROR_PASSWORD_CHANGE:int = 9;
      
      public static const ERROR_EMAIL_UNIQUE:int = 10;
      
      public static const ERROR_EMAIL_INVALID:int = 11;
      
      public static const ERROR_EMAIL_NOTFOUND:int = 12;
      
      public static const ERROR_EMAIL_NOTSENDED:int = 13;
      
      public static const ERROR_FATAL:int = 14;
      
      public static const ERROR_FATAL_DEBUG:int = 15;
      
      public static const GARAGE_AVAILABLE:int = 16;
      
      public static const ALERT_RECOVERY_LINK_SENDED:int = 17;
      
      public static const ALERT_CHAT_PROCEED:int = 18;
      
      public static const CAPTCHA_INCORRECT:int = 19;
      
      public static const ERROR_CONFIRM_EMAIL:int = 20;
      
      public static const Renamed10787:int = 21;
      
      public static const Renamed10788:int = 22;
      
      protected var bgWindow:TankWindow;
      
      private var output:LabelBase;
      
      private var message:String;
      
      private var labels:Vector.<String>;
      
      protected var alertWindow:Sprite;
      
      public var closeButton:MainPanelCloseButton;
      
      private var closable:Boolean = false;
      
      private var id:int;
      
      private var localeService:ILocaleService;
      
      private var Renamed10789:Vector.<Sprite>;
      
      public function Alert(param1:int = -1, param2:Boolean = false)
      {
         this.alerts = [];
         this.bgWindow = new TankWindow();
         this.alertWindow = new Sprite();
         this.closeButton = new MainPanelCloseButton();
         super();
         this.closable = param2;
         this.id = param1;
         this.init();
      }
      
      public static function fillButtonLabels(param1:ILocaleService) : void
      {
         Renamed1616.YES = param1.getText(TanksLocale.TEXT_ALERT_ANSWER_YES);
         Renamed1616.NO = param1.getText(TanksLocale.TEXT_ALERT_ANSWER_NO);
         Renamed1616.OK = param1.getText(TanksLocale.TEXT_ALERT_ANSWER_OK);
         Renamed1616.CANCEL = param1.getText(TanksLocale.TEXT_ALERT_ANSWER_CANCEL);
         Renamed1616.SEND = param1.getText(TanksLocale.TEXT_ALERT_ANSWER_SEND_BUG_REPORT);
         Renamed1616.Renamed3951 = param1.getText(TanksLocale.TEXT_ALERT_ANSWER_RETURN_TO_BATTLE);
         Renamed1616.GARAGE = param1.getText(TanksLocale.TEXT_ALERT_ANSWER_GO_TO_GARAGE);
         Renamed1616.Renamed3952 = param1.getText(TanksLocale.TEXT_ALERT_ANSWER_PROCEED);
         Renamed1616.Renamed10790 = "Закрыть доступ";
         Renamed1616.ENTER = param1.getText(TanksLocale.TEXT_BATTLEINFO_PANEL_PAID_BATTLES_ALERT_ANSWER_ENTER);
         Renamed1616.Renamed1618 = param1.getText(TanksLocale.TEXT_BATTLEINFO_PANEL_PAID_BATTLES_ALERT_ANSWER_DONT_ENTER);
      }
      
      private function init() : void
      {
         this.localeService = ILocaleService(OSGi.getInstance().getService(ILocaleService));
         this.bgWindow.headerLang = this.localeService.getText(TanksLocale.TEXT_GUI_LANG);
         if(Renamed1616.YES == null)
         {
            fillButtonLabels(this.localeService);
         }
         this.initStandardAlerts(this.localeService);
         if(this.id > -1)
         {
            this.showAlert(this.alerts[this.id][0],this.alerts[this.id][1]);
         }
         this.createOutput();
      }
      
      private function initStandardAlerts(param1:ILocaleService) : void
      {
         this.alerts[ALERT_QUIT] = [param1.getText(TanksLocale.TEXT_ALERT_QUIT_TEXT),Vector.<String>([Renamed1616.YES,Renamed1616.NO])];
         this.alerts[ALERT_CONFIRM_EMAIL] = [param1.getText(TanksLocale.TEXT_ALERT_EMAIL_CONFIRMED),Vector.<String>([Renamed1616.YES])];
         this.alerts[ERROR_FATAL] = [param1.getText(TanksLocale.TEXT_ERROR_FATAL),Vector.<String>([Renamed1616.Renamed3951])];
         this.alerts[ERROR_FATAL_DEBUG] = [param1.getText(TanksLocale.TEXT_ERROR_FATAL_DEBUG),Vector.<String>([Renamed1616.SEND])];
         this.alerts[ERROR_CALLSIGN_FIRST_SYMBOL] = [param1.getText(TanksLocale.TEXT_ERROR_CALLSIGN_WRONG_FIRST_SYMBOL),Vector.<String>([Renamed1616.OK])];
         this.alerts[ERROR_CALLSIGN_DEVIDE] = [param1.getText(TanksLocale.TEXT_ERROR_CALLSIGN_NOT_SINGLE_DEVIDERS),Vector.<String>([Renamed1616.OK])];
         this.alerts[ERROR_CALLSIGN_LAST_SYMBOL] = [param1.getText(TanksLocale.TEXT_ERROR_CALLSIGN_WRONG_LAST_SYMBOL),Vector.<String>([Renamed1616.OK])];
         this.alerts[ERROR_CALLSIGN_LENGTH] = [param1.getText(TanksLocale.TEXT_ERROR_CALLSIGN_LENGTH),Vector.<String>([Renamed1616.OK])];
         this.alerts[ERROR_CALLSIGN_UNIQUE] = [param1.getText(TanksLocale.TEXT_ERROR_CALLSIGN_NOT_UNIQUE),Vector.<String>([Renamed1616.OK])];
         this.alerts[ERROR_EMAIL_UNIQUE] = [param1.getText(TanksLocale.TEXT_ERROR_EMAIL_NOT_UNIQUE),Vector.<String>([Renamed1616.OK])];
         this.alerts[ERROR_EMAIL_INVALID] = [param1.getText(TanksLocale.TEXT_ERROR_EMAIL_INVALID),Vector.<String>([Renamed1616.OK])];
         this.alerts[ERROR_EMAIL_NOTFOUND] = [param1.getText(TanksLocale.TEXT_ERROR_EMAIL_NOT_FOUND),Vector.<String>([Renamed1616.OK])];
         this.alerts[ERROR_EMAIL_NOTSENDED] = [param1.getText(TanksLocale.TEXT_ERROR_EMAIL_NOT_SENDED),Vector.<String>([Renamed1616.OK])];
         this.alerts[ERROR_PASSWORD_INCORRECT] = [param1.getText(TanksLocale.TEXT_ERROR_PASSWORD_INCORRECT),Vector.<String>([Renamed1616.OK])];
         this.alerts[ERROR_PASSWORD_LENGTH] = [param1.getText(TanksLocale.TEXT_ERROR_PASSWORD_LENGTH),Vector.<String>([Renamed1616.OK])];
         this.alerts[ERROR_PASSWORD_CHANGE] = [param1.getText(TanksLocale.TEXT_ERROR_PASSWORD_CHANGE),Vector.<String>([Renamed1616.OK])];
         this.alerts[GARAGE_AVAILABLE] = [param1.getText(TanksLocale.TEXT_ALERT_GARAGE_AVAILABLE),Vector.<String>([Renamed1616.GARAGE,Renamed1616.CANCEL])];
         this.alerts[ALERT_RECOVERY_LINK_SENDED] = [param1.getText(TanksLocale.TEXT_SETTINGS_CHANGE_PASSWORD_CONFIRMATION_SENT_TEXT),Vector.<String>([Renamed1616.OK])];
         this.alerts[ALERT_CHAT_PROCEED] = [param1.getText(TanksLocale.TEXT_ALERT_CHAT_PROCEED_EXTERNAL_LINK),Vector.<String>([Renamed1616.CANCEL])];
         this.alerts[CAPTCHA_INCORRECT] = [param1.getText(TanksLocale.TEXT_CAPTCHA_INCORRECT),Vector.<String>([Renamed1616.OK])];
         this.alerts[ERROR_CONFIRM_EMAIL] = [param1.getText(TanksLocale.TEXT_ALERT_EMAIL_CONFIRMED_WRONG_LINK),Vector.<String>([Renamed1616.OK])];
         this.alerts[Renamed10787] = ["Внимание!\nПрежде чем вы сможете закрыть доступ для сервиса ВКонтакте, вам\nнеобходимо установить пароль для аккаунта \"Танков Онлайн\" в настройках.",[Renamed1616.OK]];
         this.alerts[Renamed10788] = [param1.getText(TanksLocale.TEXT_PARTNER_USERNAME_ALREDY_USED_ERROR),Vector.<String>([Renamed1616.OK])];
      }
      
      private function createOutput() : void
      {
         this.output = new LabelBase();
         this.output.autoSize = TextFieldAutoSize.CENTER;
         this.output.align = TextFormatAlign.CENTER;
         this.output.size = 14;
         this.output.width = 10;
         this.output.height = 10;
         this.output.x = -5;
         this.output.y = 30;
         this.output.multiline = true;
      }
      
      public function showAlert(param1:String, param2:Vector.<String>) : void
      {
         this.message = param1;
         this.Renamed10789 = null;
         this.labels = param2;
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      public function Renamed2166(param1:String, param2:Vector.<String>, param3:Vector.<Sprite>) : void
      {
         this.message = param1;
         this.labels = param2;
         this.Renamed10789 = param3;
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         this.doLayout(param1);
      }
      
      private function Renamed10791() : Boolean
      {
         return this.labels.length != 0;
      }
      
      private function Renamed10792() : Boolean
      {
         return this.Renamed10789 != null;
      }
      
      protected function doLayout(param1:Event) : void
      {
         var _loc2_:Sprite = null;
         var _loc3_:int = 0;
         var _loc4_:DefaultButtonBase = null;
         var _loc5_:int = this.calculateButtonsWidth();
         var _loc6_:int = _loc5_ * this.labels.length / 2;
         addChild(this.alertWindow);
         this.alertWindow.addChild(this.bgWindow);
         this.alertWindow.addChild(this.output);
         this.output.htmlText = this.message;
         if(this.Renamed10791())
         {
            _loc3_ = 0;
            while(_loc3_ < this.labels.length)
            {
               if(this.Renamed10792())
               {
                  _loc2_ = this.Renamed10789[_loc3_];
               }
               else
               {
                  (_loc2_ = new DefaultButtonBase()).label = this.labels[_loc3_];
               }
               _loc2_.x = _loc5_ * _loc3_ - _loc6_;
               _loc2_.y = this.output.y + this.output.height + 15;
               _loc2_.width = _loc5_ - 6;
               _loc2_.addEventListener(MouseEvent.CLICK,this.close);
               this.alertWindow.addChild(_loc2_);
               _loc3_++;
            }
            this.bgWindow.height = _loc2_.y + 60;
         }
         else
         {
            this.bgWindow.height = this.output.y + this.output.height + 30;
         }
         this.bgWindow.width = Math.max(int(this.output.width + 50),_loc6_ * 2 + 50);
         this.bgWindow.x = -int(this.bgWindow.width / 2) - 3;
         stage.addEventListener(Event.RESIZE,this.onStageResize);
         stage.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp,false,KeyUpListenerPriority.ALERT);
         stage.focus = this;
         if(this.closable)
         {
            this.alertWindow.addChild(this.closeButton);
            this.closeButton.x = this.bgWindow.x + this.bgWindow.width - this.closeButton.width - 10;
            this.closeButton.y = 10;
            this.closeButton.addEventListener(MouseEvent.CLICK,this.close);
         }
         this.onStageResize(null);
      }
      
      private function onKeyUp(param1:KeyboardEvent) : void
      {
         var _loc2_:String = null;
         switch(this.labels.length)
         {
            case 1:
               if(AlertUtils.isConfirmationKey(param1.keyCode) || AlertUtils.isCancelKey(param1.keyCode))
               {
                  _loc2_ = this.labels[0];
               }
               break;
            case 2:
               if(AlertUtils.isConfirmationKey(param1.keyCode))
               {
                  _loc2_ = this.getFirstExistingLabel(this.Renamed10793());
               }
               else if(AlertUtils.isCancelKey(param1.keyCode))
               {
                  _loc2_ = this.getFirstExistingLabel(this.Renamed10794());
               }
               break;
            case 3:
               if(AlertUtils.isConfirmationKey(param1.keyCode))
               {
                  _loc2_ = this.getFirstExistingLabel(this.Renamed10793());
               }
               else if(AlertUtils.isCancelKey(param1.keyCode))
               {
                  _loc2_ = this.getFirstExistingLabel(Vector.<String>([Renamed1616.CANCEL]));
               }
         }
         if(_loc2_ != null)
         {
            param1.stopImmediatePropagation();
            this.dispatchClickEventForButtonWithLabel(_loc2_);
         }
      }
      
      private function Renamed10794() : Vector.<String>
      {
         return Vector.<String>([Renamed1616.NO,Renamed1616.CANCEL,Renamed1616.Renamed3951,Renamed1616.Renamed1618]);
      }
      
      private function Renamed10793() : Vector.<String>
      {
         return Vector.<String>([Renamed1616.OK,Renamed1616.YES,Renamed1616.GARAGE,Renamed1616.Renamed3952,Renamed1616.SEND,Renamed1616.ENTER,this.localeService.getText(TanksLocale.TEXT_BATTLE_ENTER_WARNING_PARKOUR_BUTTON_ENTER)]);
      }
      
      private function getFirstExistingLabel(param1:Vector.<String>) : String
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < this.labels.length)
         {
            _loc2_ = int(param1.indexOf(this.labels[_loc3_]));
            if(_loc2_ > -1)
            {
               return param1[_loc2_];
            }
            _loc3_++;
         }
         return "";
      }
      
      private function Renamed10795(param1:Object) : Boolean
      {
         return param1 is ButtonBase || param1 is ColorButton;
      }
      
      private function Renamed10796(param1:Object) : String
      {
         if(param1 is ButtonBase)
         {
            return ButtonBase(param1).label;
         }
         if(param1 is ColorButton)
         {
            return ColorButton(param1).label;
         }
         return null;
      }
      
      private function dispatchClickEventForButtonWithLabel(param1:String) : void
      {
         var _loc2_:DisplayObject = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.alertWindow.numChildren)
         {
            _loc2_ = this.alertWindow.getChildAt(_loc3_);
            if(this.Renamed10795(_loc2_) && this.Renamed10796(_loc2_) == param1)
            {
               _loc2_.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
               return;
            }
            _loc3_++;
         }
      }
      
      private function calculateButtonsWidth() : int
      {
         var _loc1_:int = 80;
         var _loc2_:LabelBase = new LabelBase();
         var _loc3_:int = 0;
         while(_loc3_ < this.labels.length)
         {
            _loc2_.text = this.labels[_loc3_];
            if(_loc2_.width > _loc1_)
            {
               _loc1_ = _loc2_.width;
            }
            _loc3_++;
         }
         return _loc1_ + 18;
      }
      
      private function onStageResize(param1:Event) : void
      {
         this.alertWindow.x = int(stage.stageWidth / 2);
         this.alertWindow.y = int(stage.stageHeight / 2 - this.alertWindow.height / 2);
      }
      
      private function close(param1:MouseEvent) : void
      {
         stage.removeEventListener(Event.RESIZE,this.onStageResize);
         stage.removeEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
         this.removeMouseListenerFromButtons();
         while(this.alertWindow.numChildren > 0)
         {
            this.alertWindow.removeChildAt(0);
         }
         if(this.Renamed10795(param1.currentTarget))
         {
            dispatchEvent(new AlertEvent(this.Renamed10796(param1.currentTarget)));
         }
         removeDisplayObject(this);
      }
      
      private function removeMouseListenerFromButtons() : void
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.alertWindow.numChildren)
         {
            _loc1_ = this.alertWindow.getChildAt(_loc2_);
            if(_loc1_ == this.closeButton)
            {
               _loc1_.removeEventListener(MouseEvent.CLICK,this.close);
            }
            _loc2_++;
         }
      }
      
      public function Renamed10797() : void
      {
         var _loc1_:String = null;
         if(this.labels.length == 2)
         {
            _loc1_ = this.getFirstExistingLabel(this.Renamed10794());
         }
         else if(this.labels.length == 1)
         {
            _loc1_ = this.labels[0];
         }
         if(_loc1_ != null)
         {
            this.dispatchClickEventForButtonWithLabel(_loc1_);
         }
      }
   }
}

