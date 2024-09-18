package §else for break§
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.help.Helper;
   import flash.display.Bitmap;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class ControlsHelper extends Helper
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      public static const §<;§:String = "Tank.ControlsHelper";
      
      public static const §include set static§:int = 1;
      
      private var § 4§:Bitmap;
      
      public function ControlsHelper()
      {
         super();
         this.init();
      }
      
      [Obfuscation(rename="false")]
      override public function align(param1:int, param2:int) : void
      {
         this.§ 4§.x = (param1 - this.§ 4§.width) / 2;
         this.§ 4§.y = (param2 - this.§ 4§.height) / 2;
      }
      
      private function init() : void
      {
         this.§ 4§ = new Bitmap(localeService.getImage(TanksLocale.IMAGE_FULL_BATTLE_HELP));
         addChild(this.§ 4§);
         _showLimit = 10;
         showDuration = 8000;
      }
   }
}

