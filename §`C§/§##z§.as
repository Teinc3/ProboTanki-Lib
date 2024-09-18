package §`C§
{
   import alternativa.tanks.servermodels.captcha.IServerCaptcha;
   import alternativa.tanks.servermodels.login.ILogin;
   import alternativa.tanks.servermodels.loginbyhash.ILoginByHash;
   import alternativa.tanks.servermodels.registartion.password.IPasswordRegistration;
   import alternativa.tanks.servermodels.socialnetwork.IExternalEntranceModel;
   import alternativa.tanks.service.IEntranceServerFacade;
   import §case var include§.§switch set false§;
   import §final set continue§.§=n§;
   import org.robotlegs.mvcs.Actor;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   
   public class §##z§ extends Actor implements IEntranceServerFacade
   {
      [Inject]
      public static var modelRegistry:ModelRegistry;
      
      private var _gameObject:IGameObject;
      
      public function §##z§()
      {
         super();
      }
      
      public function checkCallsign(param1:String) : void
      {
         IPasswordRegistration(modelRegistry.getModelsByInterface(IPasswordRegistration)[0]).checkCallsign(param1);
      }
      
      public function §for catch if§(param1:String) : void
      {
      }
      
      public function §""B§(param1:String) : void
      {
         §switch set false§(modelRegistry.getModelsByInterface(§switch set false§)[0]).checkInvite(param1);
      }
      
      public function §switch package function§(param1:String) : void
      {
         §=n§(modelRegistry.getModelsByInterface(§=n§)[0]).sendUsersRestorePasswordLink(param1);
      }
      
      public function login(param1:String, param2:String, param3:Boolean) : void
      {
         ILogin(modelRegistry.getModelsByInterface(ILogin)[0]).login(param1,param2,param3);
      }
      
      public function §extends for super§(param1:String, param2:String) : void
      {
         IExternalEntranceModel(modelRegistry.getModelsByInterface(IExternalEntranceModel)[0]).login(param1,param2);
      }
      
      public function §5!g§() : void
      {
      }
      
      public function §else catch var§(param1:String) : void
      {
      }
      
      public function loginByHash(param1:String) : void
      {
         ILoginByHash(modelRegistry.getModelsByInterface(ILoginByHash)[0]).loginByHash(param1);
      }
      
      public function loginBySingleUseHash(param1:String) : void
      {
      }
      
      public function §for package class§(param1:String, param2:String) : void
      {
      }
      
      public function set §^#r§(param1:IGameObject) : void
      {
         this._gameObject = param1;
      }
      
      public function §finally const else§(param1:String, param2:String, param3:String, param4:Boolean, param5:String, param6:String, param7:String, param8:String) : void
      {
         IPasswordRegistration(modelRegistry.getModelsByInterface(IPasswordRegistration)[0]).register(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function §;#P§(param1:String, param2:String, param3:String, param4:String, param5:String, param6:String) : void
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
         §=n§(modelRegistry.getModelsByInterface(§=n§)[0]).changePasswordAndEmail(param1,param2);
      }
      
      public function §,!f§(param1:String, param2:String) : void
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
      
      public function §!!B§(param1:String) : void
      {
      }
      
      public function §if catch switch§(param1:String, param2:String) : void
      {
      }
      
      public function §true set set§(param1:String, param2:String) : void
      {
      }
   }
}

