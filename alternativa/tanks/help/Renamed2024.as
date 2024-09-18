package alternativa.tanks.help
{
   import alternativa.osgi.service.locale.ILocaleService;
   import Renamed404.Renamed1899;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class Renamed2024
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      private static const Renamed2025:int = 1000;
      
      private static const Renamed2026:int = 24 * 60 * 60 * Renamed2025;
      
      public function Renamed2024()
      {
         super();
      }
      
      public static function Renamed2027(param1:Date) : String
      {
         var _loc2_:Number = NaN;
         var _loc3_:String = " ";
         if(!isNaN(param1.date))
         {
            _loc2_ = param1.getTime() - new Date().getTime();
            if(_loc2_ < Renamed2026)
            {
               _loc3_ = localeService.getText(TanksLocale.TEXT_PREMIUM_COMPLETION_IN) + Renamed1899.formatTime(param1);
            }
            else
            {
               _loc3_ = localeService.getText(TanksLocale.TEXT_PREMIUM_COMPLETION) + Renamed1899.Renamed1902(param1);
            }
         }
         return _loc3_;
      }
      
      public static function Renamed2028(param1:int) : Number
      {
         return Number(param1) * Renamed2025;
      }
   }
}

