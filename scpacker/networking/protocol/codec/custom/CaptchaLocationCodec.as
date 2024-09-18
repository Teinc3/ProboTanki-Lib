package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import flash.utils.ByteArray;
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   
   public class CaptchaLocationCodec implements ICodec
   {
      public function CaptchaLocationCodec()
      {
         super();
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:CaptchaLocation = null;
         var _loc3_:int = param1.readInt();
         switch(_loc3_)
         {
            case 0:
               _loc2_ = CaptchaLocation.LOGIN_FORM;
               break;
            case 1:
               _loc2_ = CaptchaLocation.REGISTER_FORM;
               break;
            case 2:
               _loc2_ = CaptchaLocation.CLIENT_STARTUP;
               break;
            case 3:
               _loc2_ = CaptchaLocation.RESTORE_PASSWORD_FORM;
               break;
            case 4:
               _loc2_ = CaptchaLocation.EMAIL_CHANGE_HASH;
               break;
            case 5:
               _loc2_ = CaptchaLocation.ACCOUNT_SETTINGS_FORM;
         }
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         var _loc3_:int = int(param2.value);
         param1.writeInt(_loc3_);
         return 4;
      }
   }
}

