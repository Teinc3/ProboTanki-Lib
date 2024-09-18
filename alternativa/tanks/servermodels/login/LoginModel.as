package alternativa.tanks.servermodels.login
{
   import alternativa.tanks.service.IEntranceClientFacade;
   import §const catch import§.§&#V§;
   import §const catch import§.§var if§;
   
   public class LoginModel extends §&#V§ implements ILogin, §var if§
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

