package §else for break§
{
   import §]#R§.§1!X§;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.help.IHelpService;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class §const catch switch§ extends Sprite
   {
      [Inject]
      public static var helpService:IHelpService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private var §finally set include§:Bitmap;
      
      private var §2!J§:Bitmap;
      
      public function §const catch switch§()
      {
         super();
         this.§finally set include§ = new Bitmap(localeService.getImage(TanksLocale.IMAGE_HELP_CONTROLS_MINI));
         this.§2!J§ = new Bitmap(localeService.getImage(TanksLocale.IMAGE_HELP_MOUSE_MINI));
         addEventListener(MouseEvent.CLICK,§9#F§);
         this.§set const static§(§1!X§.§return for else§);
      }
      
      private static function §9#F§(param1:MouseEvent) : void
      {
         helpService.showHelp();
         param1.stopPropagation();
      }
      
      public function §set const static§(param1:int) : void
      {
         if(this.§finally set include§.parent != null)
         {
            removeChild(this.§finally set include§);
         }
         if(this.§2!J§.parent != null)
         {
            removeChild(this.§2!J§);
         }
         if(param1 == §1!X§.§return for else§)
         {
            addChild(this.§finally set include§);
         }
         else
         {
            addChild(this.§2!J§);
         }
      }
   }
}

