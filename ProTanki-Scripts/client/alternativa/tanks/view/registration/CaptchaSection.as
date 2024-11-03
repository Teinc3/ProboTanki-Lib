package alternativa.tanks.view.registration
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   import controls.base.LabelBase;
   import controls.base.TankInputBase;
   import controls.caprefbutton.CapRefButton;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.filters.BlurFilter;
   import flash.filters.DropShadowFilter;
   
   public class CaptchaSection extends Sprite
   {
      private var label:LabelBase;
      
      private var captchaContainer:Bitmap;
      
      public var captchaAnswer:TankInputBase;
      
      public var refreshButton:CapRefButton;
      
      private var _captcha:Bitmap;
      
      private var _space:int = 10;
      
      private var _margin:int = 21;
      
      public function CaptchaSection()
      {
         this.label = new LabelBase();
         this.captchaContainer = new Bitmap(new BitmapData(285,50));
         super();
      }
      
      public function Renamed3954() : void
      {
         this.initialize();
      }
      
      [PostConstruct]
      public function postConstruct() : void
      {
         this.initialize();
      }
      
      public function initialize() : void
      {
         this.label = new LabelBase();
         this.label.multiline = true;
         this.label.wordWrap = true;
         this.label.text = OSGi.getInstance().getService(ILocaleService).getText(TextConst.STRING_CAPTCHA_FORM_TITLE);
         this.label.y = -8;
         addChild(this.label);
         this.captchaContainer = new Bitmap(new BitmapData(285,50,true,0));
         this.captchaContainer.filters = [new BlurFilter(2,2),new DropShadowFilter(0,45,0,1,4,4,2)];
         addChild(this.captchaContainer);
         this.captchaAnswer = new TankInputBase();
         this.captchaAnswer.tabIndex = 5;
         this.captchaAnswer.restrict = ".0-9a-zA-z_\\-";
         addChild(this.captchaAnswer);
         if(stage != null)
         {
            stage.focus = this.captchaAnswer.textField;
         }
         this.refreshButton = new CapRefButton();
         this.refreshButton.buttonMode = this.refreshButton.useHandCursor = true;
         addChild(this.refreshButton);
         this.width = 275;
      }
      
      override public function get height() : Number
      {
         return this.captchaAnswer.y + this.captchaAnswer.height;
      }
      
      override public function set width(param1:Number) : void
      {
         this.label.width = param1 - this.label.x;
         this.captchaContainer.width = param1;
         this.captchaAnswer.width = param1;
         this.refreshButton.x = this.captchaContainer.x + this.captchaContainer.width - this.refreshButton.width - 8;
         this.captchaContainer.y = this.label.y + this.label.height + this._space;
         this.captchaAnswer.y = this.captchaContainer.y + this.captchaContainer.height + this._space;
         this.refreshButton.y = this.captchaContainer.y + this._space + 2;
      }
      
      public function alertAboutIncorrectAnswer() : void
      {
      }
      
      public function set captcha(param1:Bitmap) : void
      {
         this._captcha = param1;
         this.captchaContainer.bitmapData = this._captcha.bitmapData;
         this.captchaAnswer.value = "";
      }
      
      public function setEnabled(param1:Boolean) : void
      {
         this.captchaAnswer.enable = param1;
         this.refreshButton.doubleClickEnabled = param1;
         this.refreshButton.mouseEnabled = param1;
      }
   }
}

