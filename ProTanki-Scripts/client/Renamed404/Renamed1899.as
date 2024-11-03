package Renamed404
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.osgi.service.logging.LogService;
   import flash.globalization.DateTimeFormatter;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class AbstractPackets9
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var logService:LogService;
      
      private static var Renamed8570:DateTimeFormatter;
      
      private static var Renamed8571:DateTimeFormatter;
      
      private static var Renamed8572:DateTimeFormatter;
      
      public function AbstractPackets9()
      {
         super();
      }
      
      public static function Renamed1902(param1:Date) : String
      {
         if(Renamed8570 == null)
         {
            Renamed8570 = new DateTimeFormatter("");
            Renamed8570.setDateTimePattern(localeService.getText(TanksLocale.TEXT_DATE_FORMAT));
         }
         return Renamed8570.format(param1);
      }
      
      public static function formatTime(param1:Date) : String
      {
         if(Renamed8571 == null)
         {
            Renamed8571 = new DateTimeFormatter("");
            Renamed8571.setDateTimePattern("HH:mm");
         }
         return Renamed8571.format(param1);
      }
      
      public static function Renamed8573(param1:Date) : String
      {
         if(Renamed8572 == null)
         {
            Renamed8572 = new DateTimeFormatter("");
            Renamed8572.setDateTimePattern("HH:mm");
         }
         return Renamed8572.format(param1);
      }
   }
}

