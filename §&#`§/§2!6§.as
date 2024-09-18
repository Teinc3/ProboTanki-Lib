package §&#`§
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.IDestroyWindow;
   import alternativa.tanks.help.§break case§;
   import alternativa.tanks.newbieservice.NewbieUserService;
   import controls.TankWindow;
   import controls.TankWindowHeader;
   import controls.TankWindowInner;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextFormatAlign;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.gui.DialogWindow;
   
   public class §2!6§ extends DialogWindow implements IDestroyWindow
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var §finally var var§:NewbieUserService;
      
      private static const §["M§:Class = §native var native§;
      
      private static const §const for finally§:BitmapData = new §["M§().bitmapData;
      
      private var _isInit:Boolean;
      
      private var window:TankWindow;
      
      private var inner:TankWindowInner;
      
      private var messageBottomLabel:LabelBase;
      
      private var presentBitmap:Bitmap;
      
      private var closeButton:DefaultButtonBase;
      
      private var windowWidth:int = 450;
      
      private const WINDOW_MARGIN:int = 12;
      
      private const MARGIN:int = 9;
      
      private const §+s§:int = 300;
      
      private var _messageBottom:String;
      
      private var §static const switch§:RegExp;
      
      private var §!t§:RegExp;
      
      public function §2!6§(param1:Date, param2:int, param3:int)
      {
         this.BUTTON_SIZE = new Point(104,33);
         this.presentBitmap = new Bitmap(§const for finally§);
         this.§static const switch§ = /CRYSTAL_BONUS/gi;
         this.§!t§ = /EXPERIENCE_BONUS/gi;
         super();
         var _loc4_:String = §break case§.§>#v§(param1);
         this._messageBottom = localeService.getText(TanksLocale.TEXT_NEWBIES_ABONEMENT_WINDOW_TEXT);
         this._messageBottom += "\r\n" + _loc4_;
         this._messageBottom = this._messageBottom.replace(this.§static const switch§,param2).replace(this.§!t§,param3);
         this.init();
      }
      
      private function init() : void
      {
         this._isInit = true;
         this.windowWidth = Math.max(this.presentBitmap.width + this.WINDOW_MARGIN * 2 + this.MARGIN * 2,this.§+s§);
         this.window = new TankWindow(this.windowWidth,this.presentBitmap.height);
         this.window.headerLang = localeService.getText(TanksLocale.TEXT_GUI_LANG);
         this.window.header = TankWindowHeader.CONGRATULATIONS;
         addChild(this.window);
         this.inner = new TankWindowInner(0,0,TankWindowInner.GREEN);
         addChild(this.inner);
         this.inner.x = this.WINDOW_MARGIN;
         this.inner.y = this.WINDOW_MARGIN;
         this.presentBitmap.x = this.windowWidth - this.presentBitmap.width >> 1;
         this.presentBitmap.y = this.WINDOW_MARGIN * 2;
         addChild(this.presentBitmap);
         this.messageBottomLabel = new LabelBase();
         this.messageBottomLabel.align = TextFormatAlign.LEFT;
         this.messageBottomLabel.wordWrap = true;
         this.messageBottomLabel.multiline = true;
         this.messageBottomLabel.size = 12;
         this.messageBottomLabel.color = 5898034;
         this.messageBottomLabel.htmlText = this._messageBottom;
         this.messageBottomLabel.x = this.WINDOW_MARGIN * 2;
         this.messageBottomLabel.y = this.presentBitmap.y + this.presentBitmap.height + this.MARGIN;
         this.messageBottomLabel.width = this.windowWidth - this.WINDOW_MARGIN * 4;
         addChild(this.messageBottomLabel);
         if(this.messageBottomLabel.numLines > 2)
         {
            this.messageBottomLabel.htmlText = this._messageBottom;
            this.messageBottomLabel.width = this.windowWidth - this.WINDOW_MARGIN * 4;
         }
         this.closeButton = new DefaultButtonBase();
         addChild(this.closeButton);
         this.closeButton.label = localeService.getText(TanksLocale.TEXT_FREE_BONUSES_WINDOW_BUTTON_CLOSE_TEXT);
         var _loc1_:int = this.presentBitmap.height + this.closeButton.height + this.MARGIN * 2 + this.WINDOW_MARGIN * 3;
         if(this.messageBottomLabel != null)
         {
            _loc1_ += this.messageBottomLabel.height + this.MARGIN;
         }
         this.window.height = _loc1_;
         this.closeButton.y = this.window.height - this.MARGIN - 35;
         this.closeButton.x = this.window.width - this.closeButton.width >> 1;
         this.inner.width = this.window.width - this.WINDOW_MARGIN * 2;
         this.inner.height = this.window.height - this.WINDOW_MARGIN - this.MARGIN * 2 - this.BUTTON_SIZE.y + 2;
         this.closeButton.addEventListener(MouseEvent.CLICK,this.closeWindow);
         dialogService.enqueueDialog(this);
      }
      
      private function closeWindow(param1:MouseEvent = null) : void
      {
         if(§finally var var§.isNewbieUser)
         {
            §finally var var§.isNewbieUser = false;
         }
         this.destroy();
      }
      
      public function destroy() : void
      {
         if(this._isInit)
         {
            this._isInit = false;
            this.closeButton.removeEventListener(MouseEvent.CLICK,this.closeWindow);
            dialogService.removeDialog(this);
         }
      }
      
      override protected function cancelKeyPressed() : void
      {
         this.closeWindow();
      }
      
      override protected function confirmationKeyPressed() : void
      {
         this.closeWindow();
      }
   }
}

