package alternativa.tanks.gui
{
   import alternativa.osgi.service.locale.ILocaleService;
   import assets.Diamond;
   import assets.icons.IconGarageMod;
   import controls.Money;
   import controls.TankWindow;
   import controls.TankWindowInner;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import controls.timer.CountDownTimer;
   import controls.timer.CountDownTimerOnCompleteBefore;
   import controls.timer.CountDownTimerOnTick;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.text.TextFormatAlign;
   import flash.utils.getTimer;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.gui.DialogWindow;
   
   public class ConfirmAlert extends DialogWindow implements CountDownTimerOnTick, CountDownTimerOnCompleteBefore
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      private var window:TankWindow;
      
      private var upgradeIndicator:IconGarageMod;
      
      private var preview:Bitmap;
      
      private var previewInner:TankWindowInner;
      
      private var questionLabel:LabelBase;
      
      private var costLabel:LabelBase;
      
      private var nameLabel:LabelBase;
      
      private var crystalIcon:Diamond;
      
      public var confirmButton:DefaultButtonBase;
      
      public var cancelButton:DefaultButtonBase;
      
      private var windowWidth:int;
      
      private var windowHeight:int;
      
      private const windowMargin:int = 11;
      
      private const spaceModule:int = 7;
      
      private var timer:CountDownTimer;
      
      public function ConfirmAlert(param1:String, param2:int, param3:BitmapData, param4:Boolean, param5:int, param6:String, param7:int = -1, param8:Boolean = false)
      {
         this.previewSize = new Point(164,106);
         this.buttonSize = new Point(104,33);
         super();
         this.windowWidth = Math.max(this.buttonSize.x * 2 + this.windowMargin * 2 + this.spaceModule,this.previewSize.x + this.windowMargin * 4);
         this.window = new TankWindow(this.windowWidth,0);
         addChild(this.window);
         this.previewInner = new TankWindowInner(0,0,TankWindowInner.GREEN);
         this.previewInner.x = this.windowMargin;
         this.previewInner.y = this.windowMargin;
         this.previewInner.width = this.windowWidth - this.windowMargin * 2;
         this.previewInner.height = this.previewSize.y + this.windowMargin * 2;
         addChild(this.previewInner);
         this.preview = new Bitmap(param3);
         addChild(this.preview);
         this.preview.x = this.previewInner.x + int((this.windowWidth - this.windowMargin * 2 - this.previewSize.x) * 0.5);
         this.preview.y = this.windowMargin * 2;
         if(param5 != -1)
         {
            this.upgradeIndicator = new IconGarageMod();
            addChild(this.upgradeIndicator);
            this.upgradeIndicator.x = this.windowWidth - this.windowMargin - this.spaceModule - this.upgradeIndicator.width + 2;
            this.upgradeIndicator.y = this.windowMargin + this.spaceModule - 1;
            this.upgradeIndicator.mod = param5;
         }
         this.questionLabel = new LabelBase();
         addChild(this.questionLabel);
         this.questionLabel.align = TextFormatAlign.CENTER;
         this.questionLabel.htmlText = param6;
         this.questionLabel.x = this.windowWidth - this.questionLabel.width >> 1;
         this.questionLabel.width = this.windowWidth - this.windowMargin * 2;
         this.questionLabel.y = this.previewInner.y + this.previewSize.y + this.windowMargin * 2 + this.spaceModule;
         this.nameLabel = new LabelBase();
         addChild(this.nameLabel);
         if(param5 > 0)
         {
            this.nameLabel.text = "\"" + param1 + "\" " + localeService.getText(TanksLocale.TEXT_GARAGE_CONFIRM_ALERT_COST_PREFIX);
         }
         else
         {
            this.nameLabel.text = "\"" + param1 + "\" " + (param7 > 1 ? "(" + param7 + ") " : "") + localeService.getText(TanksLocale.TEXT_GARAGE_CONFIRM_ALERT_COST_PREFIX);
         }
         this.crystalIcon = new Diamond();
         addChild(this.crystalIcon);
         this.costLabel = new LabelBase();
         addChild(this.costLabel);
         this.costLabel.text = Money.numToString(param2,false);
         var _loc9_:int = this.nameLabel.width + this.costLabel.width + this.crystalIcon.width + 2;
         var _loc10_:* = this.windowWidth - _loc9_ >> 1;
         this.nameLabel.x = _loc10_;
         this.nameLabel.y = this.questionLabel.y + this.questionLabel.height + this.windowMargin;
         this.crystalIcon.x = this.nameLabel.x + this.nameLabel.width + 2;
         this.crystalIcon.y = this.nameLabel.y + 5;
         this.costLabel.x = this.crystalIcon.x + this.crystalIcon.width;
         this.costLabel.y = this.nameLabel.y;
         this.windowHeight = this.nameLabel.y + this.nameLabel.height + this.windowMargin * 2 + this.buttonSize.y;
         this.cancelButton = new DefaultButtonBase();
         addChild(this.cancelButton);
         this.cancelButton.label = localeService.getText(TanksLocale.TEXT_GARAGE_CONFIRM_ALERT_CANCEL_BUTTON_TEXT);
         this.cancelButton.x = this.windowWidth - this.buttonSize.x - 3;
         this.cancelButton.y = this.windowHeight - this.windowMargin - this.buttonSize.y + 2;
         this.confirmButton = new DefaultButtonBase();
         addChild(this.confirmButton);
         if(param8)
         {
            this.confirmButton.enable = false;
            this.timer = new CountDownTimer();
            this.timer.addListener(CountDownTimerOnTick,this);
            this.timer.addListener(CountDownTimerOnCompleteBefore,this);
            this.confirmButton.label = localeService.getText(TanksLocale.TEXT_GARAGE_CONFIRM_ALERT_CONFIRM_BUTTON_TEXT) + " (3)";
            this.timer.start(3000 + getTimer());
         }
         else
         {
            this.confirmButton.label = localeService.getText(TanksLocale.TEXT_GARAGE_CONFIRM_ALERT_CONFIRM_BUTTON_TEXT);
         }
         this.confirmButton.x = this.windowMargin;
         this.confirmButton.y = this.windowHeight - this.windowMargin - this.buttonSize.y + 2;
         this.window.height = this.windowHeight;
      }
      
      public function onTick(param1:CountDownTimer) : void
      {
         this.confirmButton.label = localeService.getText(TanksLocale.TEXT_GARAGE_CONFIRM_ALERT_CONFIRM_BUTTON_TEXT) + " (" + param1.getRemainingSeconds() + ")";
      }
      
      public function onCompleteBefore(param1:CountDownTimer, param2:Boolean) : void
      {
         this.confirmButton.enable = true;
         this.confirmButton.label = localeService.getText(TanksLocale.TEXT_GARAGE_CONFIRM_ALERT_CONFIRM_BUTTON_TEXT);
      }
   }
}

