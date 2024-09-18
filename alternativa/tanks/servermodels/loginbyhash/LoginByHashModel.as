package alternativa.tanks.servermodels.loginbyhash
{
   import alternativa.tanks.service.IEntranceClientFacade;
   import flash.net.SharedObject;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import Renamed455.Renamed3553;
   import Renamed455.Renamed3554;
   
   public class LoginByHashModel extends Renamed3554 implements ILoginByHash, Renamed3553
   {
      [Inject]
      public static var clientFacade:IEntranceClientFacade;
      
      [Inject]
      public static var storageService:IStorageService;
      
      public function LoginByHashModel()
      {
         super();
      }
      
      public function loginBySingleUseHash(param1:String) : void
      {
         server.loginBySingleUseHash(param1);
      }
      
      public function loginByHash(param1:String) : void
      {
         server.loginByHash(param1);
      }
      
      public function loginBySingleUseHashFailed() : void
      {
         clientFacade.goToLoginForm();
      }
      
      public function loginByHashFailed() : void
      {
         var _loc1_:SharedObject = storageService.getStorage();
         _loc1_.data.userHash = null;
         _loc1_.flush();
         clientFacade.goToLoginForm();
      }
      
      public function rememberUsersHash(param1:String) : void
      {
         var _loc2_:SharedObject = storageService.getStorage();
         _loc2_.data.userHash = param1;
         _loc2_.flush();
      }
   }
}

