package §native get§
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.osgi.service.logging.LogService;
   import flash.globalization.DateTimeFormatter;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class §override for use§
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var logService:LogService;
      
      private static var §package package static§:DateTimeFormatter;
      
      private static var §7#@§:DateTimeFormatter;
      
      private static var §]6§:DateTimeFormatter;
      
      public function §override for use§()
      {
         super();
      }
      
      public static function §3!X§(param1:Date) : String
      {
         if(§package package static§ == null)
         {
            §package package static§ = new DateTimeFormatter("");
            §package package static§.setDateTimePattern(localeService.getText(TanksLocale.TEXT_DATE_FORMAT));
         }
         return §package package static§.format(param1);
      }
      
      public static function formatTime(param1:Date) : String
      {
         if(§7#@§ == null)
         {
            §7#@§ = new DateTimeFormatter("");
            §7#@§.setDateTimePattern("HH:mm");
         }
         return §7#@§.format(param1);
      }
      
      public static function §package set super§(param1:Date) : String
      {
         if(§]6§ == null)
         {
            §]6§ = new DateTimeFormatter("");
            §]6§.setDateTimePattern("HH:mm");
         }
         return §]6§.format(param1);
      }
   }
}

