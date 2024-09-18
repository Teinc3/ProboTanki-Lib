package alternativa.tanks.servermodels.login
{
   import alternativa.tanks.service.IEntranceClientFacade;
   import Renamed334.Renamed3551;
   import Renamed334.Renamed3552;
   
   public class LoginModel extends Renamed3551 implements ILogin, Renamed3552
   {
      [Inject]
      public static var entranceClientFacade:IEntranceClientFacade;
      
      public function LoginModel()
      {
         super();
      }
      
      public function wrongPassword() : void
      {
         entranceClientFacade.wrongPassword();
      }
      
      public function login(param1:String, param2:String, param3:Boolean) : void
      {
         server.login(param1,param2,param3);
      }
   }
}

