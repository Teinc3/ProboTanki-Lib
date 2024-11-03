package alternativa.tanks.service
{
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   
   public interface IEntranceServerFacade
   {
      function checkCallsign(param1:String) : void;
      
      function Renamed3593(param1:String) : void;
      
      function Renamed1570(param1:String) : void;
      
      function Renamed1569(param1:String) : void;
      
      function login(param1:String, param2:String, param3:Boolean) : void;
      
      function Renamed1575(param1:String, param2:String) : void;
      
      function Renamed3594() : void;
      
      function Renamed3595(param1:String) : void;
      
      function changePasswordAndEmail(param1:String, param2:String) : void;
      
      function loginByHash(param1:String) : void;
      
      function loginBySingleUseHash(param1:String) : void;
      
      function Renamed3596(param1:String, param2:String) : void;
      
      function set Renamed3539(param1:IGameObject) : void;
      
      function Renamed1568(param1:String, param2:String, param3:String, param4:Boolean, param5:String, param6:String, param7:String, param8:String) : void;
      
      function Renamed3597(param1:String, param2:String, param3:String, param4:String, param5:String, param6:String) : void;
      
      function getNewCaptcha(param1:CaptchaLocation) : void;
      
      function checkCaptcha(param1:String, param2:CaptchaLocation) : void;
      
      function Renamed3598(param1:String, param2:String) : void;
      
      function startExternalRegisterUser(param1:String, param2:Boolean, param3:String) : void;
      
      function startExternalLoginUser(param1:String, param2:Boolean, param3:String) : void;
      
      function finishExternalRegisterUser(param1:String, param2:String) : void;
      
      function Renamed3599(param1:String) : void;
      
      function Renamed3600(param1:String, param2:String) : void;
      
      function Renamed3601(param1:String, param2:String) : void;
   }
}

