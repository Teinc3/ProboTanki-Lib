package alternativa.tanks.servermodels.registartion.password
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.service.IEntranceClientFacade;
   import alternativa.tanks.service.IPasswordParamsService;
   import alternativa.tanks.tracker.ITrackerService;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.client.entrance.model.entrance.registration.IRegistrationModelBase;
   import projects.tanks.client.entrance.model.entrance.registration.RegistrationModelBase;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import services.alertservice.Renamed1616;
   import utils.preview.IImageResource;
   import utils.preview.ImageResourceLoadingWrapper;
   
   public class PasswordRegistrationModel extends RegistrationModelBase implements IRegistrationModelBase, IPasswordRegistration, ObjectLoadListener, IImageResource
   {
      [Inject]
      public static var facade:IEntranceClientFacade;
      
      [Inject]
      public static var passwordParamsService:IPasswordParamsService;
      
      [Inject]
      public static var alertService:IAlertService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var trackerService:ITrackerService;
      
      public function PasswordRegistrationModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         passwordParamsService.minPasswordLength = getInitParam().minPasswordLength;
         passwordParamsService.maxPasswordLength = getInitParam().maxPasswordLength;
         var _loc1_:ImageResource = getInitParam().bgResource;
         if(_loc1_.isLazy && !_loc1_.isLoaded)
         {
            _loc1_.loadLazyResource(new ImageResourceLoadingWrapper(this));
         }
         else
         {
            this.setPreviewResource(_loc1_);
         }
      }
      
      public function enteredUidIsFree() : void
      {
         facade.Renamed3557();
      }
      
      public function anchorRegistration() : void
      {
      }
      
      public function enteredUidIsBusy(param1:Vector.<String>) : void
      {
         facade.Renamed3558(param1);
      }
      
      public function enteredUidIsIncorrect() : void
      {
         facade.Renamed3559();
      }
      
      public function passwordIsIncorrect() : void
      {
         facade.Renamed3560();
      }
      
      public function registrationFailed() : void
      {
         alertService.showAlert("Registration failed. Try again.",Vector.<String>([localeService.getText(Renamed1616.OK)]));
      }
      
      public function register(param1:String, param2:String, param3:String, param4:Boolean, param5:String, param6:String, param7:String, param8:String) : void
      {
         server.register(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function checkCallsign(param1:String) : void
      {
         server.checkUid(param1);
      }
      
      public function setPreviewResource(param1:ImageResource) : void
      {
         if(facade != null)
         {
            facade.Renamed3561 = param1.data;
         }
      }
   }
}

