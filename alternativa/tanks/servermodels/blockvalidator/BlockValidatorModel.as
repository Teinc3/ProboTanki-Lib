package alternativa.tanks.servermodels.blockvalidator
{
   import Renamed272.Renamed3541;
   import Renamed272.Renamed3542;
   import alternativa.tanks.service.IEntranceClientFacade;
   import alternativa.tanks.tracker.ITrackerService;
   import flash.net.SharedObject;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   
   public class BlockValidatorModel extends Renamed3541 implements Renamed3542
   {
      [Inject]
      public static var clientFacade:IEntranceClientFacade;
      
      [Inject]
      public static var storageService:IStorageService;
      
      [Inject]
      public static var trackerService:ITrackerService;
      
      public function BlockValidatorModel()
      {
         super();
      }
      
      public function youAreBlocked(param1:String) : void
      {
         clientFacade.Renamed3543(param1);
         var _loc2_:SharedObject = storageService.getStorage();
         _loc2_.data.userHash = null;
         _loc2_.flush();
         trackerService.trackEvent("entrance","youAreBlocked","");
      }
      
      public function youWereKicked(param1:String, param2:int, param3:int, param4:int) : void
      {
         clientFacade.Renamed3544(param1,param2,param3,param4);
         var _loc5_:SharedObject = storageService.getStorage();
         _loc5_.data.userHash = null;
         _loc5_.flush();
         trackerService.trackEvent("entrance","youWereKicked","");
      }
   }
}

