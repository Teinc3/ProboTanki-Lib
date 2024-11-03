package Renamed501
{
   import alternativa.tanks.servermodels.captcha.IServerCaptcha;
   import alternativa.tanks.servermodels.login.ILogin;
   import alternativa.tanks.servermodels.loginbyhash.ILoginByHash;
   import alternativa.tanks.servermodels.registartion.password.IPasswordRegistration;
   import alternativa.tanks.servermodels.socialnetwork.IExternalEntranceModel;
   import alternativa.tanks.service.IEntranceServerFacade;
   import Renamed319.Renamed4834;
   import Renamed362.Renamed4836;
   import org.robotlegs.mvcs.Actor;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   
   public class Renamed545 extends Actor implements IEntranceServerFacade
   {
      [Inject]
      public static var modelRegistry:ModelRegistry;
      
      private var _gameObject:IGameObject;
      
      public function Renamed545()
      {
         super();
      }
      
      public function checkCallsign(param1:String) : void
      {
         IPasswordRegistration(modelRegistry.getModelsByInterface(IPasswordRegistration)[0]).checkCallsign(param1);
      }
      
      public function Renamed3593(param1:String) : void
      {
      }
      
      public function Renamed1570(param1:String) : void
      {
         Renamed4834(modelRegistry.getModelsByInterface(Renamed4834)[0]).checkInvite(param1);
      }
      
      public function Renamed1569(param1:String) : void
      {
         Renamed4836(modelRegistry.getModelsByInterface(Renamed4836)[0]).sendUsersRestorePasswordLink(param1);
      }
      
      public function login(param1:String, param2:String, param3:Boolean) : void
      {
         ILogin(modelRegistry.getModelsByInterface(ILogin)[0]).login(param1,param2,param3);
      }
      
      public function Renamed1575(param1:String, param2:String) : void
      {
         IExternalEntranceModel(modelRegistry.getModelsByInterface(IExternalEntranceModel)[0]).login(param1,param2);
      }
      
      public function Renamed3594() : void
      {
      }
      
      public function Renamed3595(param1:String) : void
      {
      }
      
      public function loginByHash(param1:String) : void
      {
         ILoginByHash(modelRegistry.getModelsByInterface(ILoginByHash)[0]).loginByHash(param1);
      }
      
      public function loginBySingleUseHash(param1:String) : void
      {
      }
      
      public function Renamed3596(param1:String, param2:String) : void
      {
      }
      
      public function set Renamed3539(param1:IGameObject) : void
      {
         this._gameObject = param1;
      }
      
      public function Renamed1568(param1:String, param2:String, param3:String, param4:Boolean, param5:String, param6:String, param7:String, param8:String) : void
      {
         IPasswordRegistration(modelRegistry.getModelsByInterface(IPasswordRegistration)[0]).register(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function Renamed3597(param1:String, param2:String, param3:String, param4:String, param5:String, param6:String) : void
      {
      }
      
      public function getNewCaptcha(param1:CaptchaLocation) : void
      {
         IServerCaptcha(modelRegistry.getModelsByInterface(IServerCaptcha)[0]).getNewCaptcha(param1);
      }
      
      public function checkCaptcha(param1:String, param2:CaptchaLocation) : void
      {
         IServerCaptcha(modelRegistry.getModelsByInterface(IServerCaptcha)[0]).checkCaptcha(param1,param2);
      }
      
      public function changePasswordAndEmail(param1:String, param2:String) : void
      {
         Renamed4836(modelRegistry.getModelsByInterface(Renamed4836)[0]).changePasswordAndEmail(param1,param2);
      }
      
      public function Renamed3598(param1:String, param2:String) : void
      {
      }
      
      public function startExternalRegisterUser(param1:String, param2:Boolean, param3:String) : void
      {
         IExternalEntranceModel(modelRegistry.getModelsByInterface(IExternalEntranceModel)[0]).startExternalRegisterUser(param1,param2,param3);
      }
      
      public function startExternalLoginUser(param1:String, param2:Boolean, param3:String) : void
      {
         IExternalEntranceModel(modelRegistry.getModelsByInterface(IExternalEntranceModel)[0]).startExternalLoginUser(param1,param2,param3);
      }
      
      public function finishExternalRegisterUser(param1:String, param2:String) : void
      {
         IExternalEntranceModel(modelRegistry.getModelsByInterface(IExternalEntranceModel)[0]).finishExternalRegisterUser(param1,param2);
      }
      
      public function Renamed3599(param1:String) : void
      {
      }
      
      public function Renamed3600(param1:String, param2:String) : void
      {
      }
      
      public function Renamed3601(param1:String, param2:String) : void
      {
      }
   }
}

