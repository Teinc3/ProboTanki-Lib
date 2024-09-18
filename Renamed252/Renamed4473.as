package Renamed252
{
   import alternativa.osgi.service.locale.ILocaleService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import services.alertservice.Renamed1616;
   import Renamed417.Renamed4479;
   import Renamed417.Renamed6737;
   
   public class Renamed4473 extends Renamed6737 implements Renamed4479
   {
      [Inject]
      public static var alertService:IAlertService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      public function Renamed4473()
      {
         super();
      }
      
      public function show(param1:String) : void
      {
         alertService.showAlert(param1,Vector.<String>([localeService.getText(Renamed1616.OK)]));
      }
   }
}

