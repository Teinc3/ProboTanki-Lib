package alternativa.tanks.service
{
   import Renamed236.Renamed2178;
   import flash.display.BitmapData;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.entrance.model.entrance.emailconfirm.ConfirmEmailStatus;
   
   public interface IEntranceClientFacade extends Renamed2178
   {
      function set Renamed3561(param1:BitmapData) : void;
      
      function set Renamed3539(param1:IGameObject) : void;
      
      function wrongPassword() : void;
      
      function Renamed3570() : void;
      
      function Renamed3575() : void;
      
      function Renamed3576() : void;
      
      function Renamed3577(param1:String) : void;
      
      function goToLoginForm() : void;
      
      function Renamed3557() : void;
      
      function Renamed3558(param1:Vector.<String>) : void;
      
      function Renamed3559() : void;
      
      function Renamed3578() : void;
      
      function Renamed3579() : void;
      
      function Renamed3580() : void;
      
      function Renamed3581(param1:String) : void;
      
      function Renamed3582(param1:Boolean, param2:String) : void;
      
      function Renamed3540() : void;
      
      function set inviteEnabled(param1:Boolean) : void;
      
      function set registrationThroughEmail(param1:Boolean) : void;
      
      function set antiAddictionEnabled(param1:Boolean) : void;
      
      function Renamed3583(param1:ConfirmEmailStatus) : void;
      
      function Renamed3543(param1:String) : void;
      
      function Renamed3544(param1:String, param2:int, param3:int, param4:int) : void;
      
      function Renamed3584() : void;
      
      function Renamed3585() : void;
      
      function Renamed3586() : void;
      
      function Renamed3587() : void;
      
      function Renamed3588() : void;
      
      function Renamed3589() : void;
      
      function Renamed3560() : void;
      
      function Renamed3568(param1:String) : void;
      
      function Renamed3569(param1:String) : void;
      
      function serverHalt() : void;
      
      function Renamed3590() : void;
      
      function emailIsBusy() : void;
      
      function Renamed3591() : void;
      
      function emailDomainIsForbidden() : void;
      
      function Renamed3592(param1:String) : void;
      
      function externalLinkAlreadyExists() : void;
      
      function externalValidationFailed() : void;
   }
}

