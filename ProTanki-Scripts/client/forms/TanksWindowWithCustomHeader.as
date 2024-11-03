package forms
{
   import alternativa.osgi.service.locale.ILocaleService;
   import controls.TankWindow;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   
   public class TanksWindowWithCustomHeader extends TankWindow
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      private static var BACKGROUND:Class = TanksWindowWithCustomHeader_BACKGROUND;
      
      private var headerBackground:Bitmap;
      
      private var headerText:DisplayObject;
      
      public function TanksWindowWithCustomHeader()
      {
         this.headerBackground = new Bitmap(new BACKGROUND().bitmapData);
         super();
      }
      
      public function set customHeader(param1:String) : void
      {
         addChild(this.headerBackground);
         this.headerBackground.y = -26;
         this.headerText = new Bitmap(localeService.getImage(param1));
         addChild(this.headerText);
         this.draw();
      }
      
      private function draw() : void
      {
         if(contains(this.headerBackground))
         {
            this.headerBackground.x = int(this.width - this.headerBackground.width) / 2;
            this.headerText.x = this.headerBackground.x + int(this.headerBackground.width - this.headerText.width) / 2;
            this.headerText.y = this.headerBackground.y + int(this.headerBackground.height - this.headerText.height) / 2 - 2;
         }
      }
   }
}

