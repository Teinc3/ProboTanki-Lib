package Renamed351
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.help.Helper;
   import flash.display.Bitmap;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class ControlsHelper extends Helper
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      public static const Renamed8082:String = "Tank.ControlsHelper";
      
      public static const Renamed8083:int = 1;
      
      private var Renamed8084:Bitmap;
      
      public function ControlsHelper()
      {
         super();
         this.init();
      }
      
      [Obfuscation(rename="false")]
      override public function align(param1:int, param2:int) : void
      {
         this.Renamed8084.x = (param1 - this.Renamed8084.width) / 2;
         this.Renamed8084.y = (param2 - this.Renamed8084.height) / 2;
      }
      
      private function init() : void
      {
         this.Renamed8084 = new Bitmap(localeService.getImage(TanksLocale.IMAGE_FULL_BATTLE_HELP));
         addChild(this.Renamed8084);
         _showLimit = 10;
         showDuration = 8000;
      }
   }
}

