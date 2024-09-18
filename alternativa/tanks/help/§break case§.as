package alternativa.tanks.help
{
   import alternativa.osgi.service.locale.ILocaleService;
   import §native get§.§override for use§;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class §break case§
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      private static const §if set function§:int = 1000;
      
      private static const §;"I§:int = 24 * 60 * 60 * §if set function§;
      
      public function §break case§()
      {
         super();
      }
      
      public static function §>#v§(param1:Date) : String
      {
         var _loc2_:Number = NaN;
         var _loc3_:String = " ";
         if(!isNaN(param1.date))
         {
            _loc2_ = param1.getTime() - new Date().getTime();
            if(_loc2_ < §;"I§)
            {
               _loc3_ = localeService.getText(TanksLocale.TEXT_PREMIUM_COMPLETION_IN) + §override for use§.formatTime(param1);
            }
            else
            {
               _loc3_ = localeService.getText(TanksLocale.TEXT_PREMIUM_COMPLETION) + §override for use§.§3!X§(param1);
            }
         }
         return _loc3_;
      }
      
      public static function §override package finally§(param1:int) : Number
      {
         return Number(param1) * §if set function§;
      }
   }
}

