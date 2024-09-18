package projects.tanks.clients.flash.commons.services.validate
{
   public class ValidateService implements IValidateService
   {
      public static const §use package continue§:String = "[a-z0-9A-Z]";
      
      public static const EMAIL_PATTERN:RegExp = /^[a-zA-Z0-9]([\-\_\.]?[a-zA-Z0-9\*]+)*@[a-zA-Z0-9]([\-\_\.]?[a-zA-Z0-9*]+)*\.[a-zA-Z]{2,}$/i;
      
      public static const UID_PATTERN:RegExp = /^[a-z0-9](([\.\-\w](?!(-|_|\.){2,}))*[a-z0-9])?$/i;
      
      public static const NOT_ALLOWED_PATTERN_FOR_REGISTRATION:RegExp = /[^0-9a-zA-Z\.\-\_]/gi;
      
      public static const NOT_ALLOWED_PATTERN_FOR_LOGIN:RegExp = /[^0-9a-zA-Z@\.\-\_]/gi;
      
      public function ValidateService()
      {
         this.CHINA_NAME_PATTERN = /^[一-龥]+$/;
         super();
      }
      
      public function isUidValid(param1:String) : Boolean
      {
         return param1.match(UID_PATTERN) != null && param1.length >= 2;
      }
      
      public function isEmailValid(param1:String) : Boolean
      {
         return param1.match(EMAIL_PATTERN) != null;
      }
      
      public function isValidIdentificationStringForRegistration(param1:String) : Boolean
      {
         return param1.match(NOT_ALLOWED_PATTERN_FOR_REGISTRATION).length == 0;
      }
      
      public function isValidIdentificationStringForLogin(param1:String) : Boolean
      {
         return param1.match(NOT_ALLOWED_PATTERN_FOR_LOGIN).length == 0;
      }
      
      public function §,!4§(param1:String) : Boolean
      {
         return param1.search(§use package continue§) == 0;
      }
      
      public function isChinaCardIdValid(param1:String) : Boolean
      {
         return ChinaCardIdValidator.isValidIdNumber(param1);
      }
      
      public function isChinaNameValid(param1:String) : Boolean
      {
         return param1.match(this.CHINA_NAME_PATTERN) != null;
      }
   }
}

