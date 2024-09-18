package §5!P§
{
   import alternativa.osgi.service.locale.ILocaleService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import services.alertservice.§get const use§;
   import §set implements§.§`!`§;
   import §set implements§.§final set return§;
   
   public class §!#m§ extends §final set return§ implements §`!`§
   {
      [Inject]
      public static var alertService:IAlertService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      public function §!#m§()
      {
         super();
      }
      
      public function show(param1:String) : void
      {
         alertService.showAlert(param1,Vector.<String>([localeService.getText(§get const use§.OK)]));
      }
   }
}

