package Renamed351
{
   import Renamed479.Renamed912;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.help.IHelpService;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class Renamed4666 extends Sprite
   {
      [Inject]
      public static var helpService:IHelpService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private var Renamed8085:Bitmap;
      
      private var Renamed8086:Bitmap;
      
      public function Renamed4666()
      {
         super();
         this.Renamed8085 = new Bitmap(localeService.getImage(TanksLocale.IMAGE_HELP_CONTROLS_MINI));
         this.Renamed8086 = new Bitmap(localeService.getImage(TanksLocale.IMAGE_HELP_MOUSE_MINI));
         addEventListener(MouseEvent.CLICK,Renamed8087);
         this.Renamed3876(Renamed912.Renamed1025);
      }
      
      private static function Renamed8087(param1:MouseEvent) : void
      {
         helpService.showHelp();
         param1.stopPropagation();
      }
      
      public function Renamed3876(param1:int) : void
      {
         if(this.Renamed8085.parent != null)
         {
            removeChild(this.Renamed8085);
         }
         if(this.Renamed8086.parent != null)
         {
            removeChild(this.Renamed8086);
         }
         if(param1 == Renamed912.Renamed1025)
         {
            addChild(this.Renamed8085);
         }
         else
         {
            addChild(this.Renamed8086);
         }
      }
   }
}

