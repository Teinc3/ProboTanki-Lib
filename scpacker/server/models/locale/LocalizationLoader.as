package scpacker.server.models.locale
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   
   public class LocalizationLoader
   {
      public static var localeService:ILocaleService = OSGi.getInstance().getService(ILocaleService) as ILocaleService;
      
      public function LocalizationLoader()
      {
         super();
      }
      
      public function init(param1:String) : void
      {
      }
   }
}

