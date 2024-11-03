package alternativa.tanks.model
{
   import org.robotlegs.mvcs.Actor;
   
   public class EntranceUrlParamsModel extends Actor
   {
      private var _entranceHash:String;
      
      private var _singleUseHash:String;
      
      private var _domain:String;
      
      private var _passedCallsign:String;
      
      private var _passedPassword:String;
      
      private var _emailConfirmHash:String;
      
      private var _emailChangeHash:String;
      
      private var _email:String;
      
      private var _referralHash:String;
      
      private var _ifengUserName:String;
      
      private var _ifengServerRegion:String;
      
      private var _ifengTime:String;
      
      private var _ifengFlag:String;
      
      private var _ifengCm:String;
      
      private var _tutorialHash:String;
      
      public function EntranceUrlParamsModel()
      {
         super();
      }
      
      public function get entranceHash() : String
      {
         return this._entranceHash;
      }
      
      public function get domain() : String
      {
         return this._domain;
      }
      
      public function get passedCallsign() : String
      {
         return this._passedCallsign;
      }
      
      public function get emailConfirmHash() : String
      {
         return this._emailConfirmHash;
      }
      
      public function get emailChangeHash() : String
      {
         return this._emailChangeHash;
      }
      
      public function get email() : String
      {
         return this._email;
      }
      
      public function get referralHash() : String
      {
         return this._referralHash;
      }
      
      public function get ifengUserName() : String
      {
         return this._ifengUserName;
      }
      
      public function get singleUseHash() : String
      {
         return this._singleUseHash;
      }
      
      public function set entranceHash(param1:String) : void
      {
         this._entranceHash = param1;
      }
      
      public function set domain(param1:String) : void
      {
         this._domain = param1;
      }
      
      public function set passedCallsign(param1:String) : void
      {
         this._passedCallsign = param1;
      }
      
      public function set emailConfirmHash(param1:String) : void
      {
         this._emailConfirmHash = param1;
      }
      
      public function set emailChangeHash(param1:String) : void
      {
         this._emailChangeHash = param1;
      }
      
      public function set email(param1:String) : void
      {
         this._email = param1;
      }
      
      public function set referralHash(param1:String) : void
      {
         this._referralHash = param1;
      }
      
      public function set ifengUserName(param1:String) : void
      {
         this._ifengUserName = param1;
      }
      
      public function set singleUseHash(param1:String) : void
      {
         this._singleUseHash = param1;
      }
      
      public function set ifengServerRegion(param1:String) : void
      {
         this._ifengServerRegion = param1;
      }
      
      public function set ifengTime(param1:String) : void
      {
         this._ifengTime = param1;
      }
      
      public function set ifengFlag(param1:String) : void
      {
         this._ifengFlag = param1;
      }
      
      public function set ifengCm(param1:String) : void
      {
         this._ifengCm = param1;
      }
      
      public function get ifengServerRegion() : String
      {
         return this._ifengServerRegion;
      }
      
      public function get ifengTime() : String
      {
         return this._ifengTime;
      }
      
      public function get ifengFlag() : String
      {
         return this._ifengFlag;
      }
      
      public function get ifengCm() : String
      {
         return this._ifengCm;
      }
      
      public function get tutorialHash() : String
      {
         return this._tutorialHash;
      }
      
      public function set tutorialHash(param1:String) : void
      {
         this._tutorialHash = param1;
      }
      
      public function get passedPassword() : String
      {
         return this._passedPassword;
      }
      
      public function set passedPassword(param1:String) : void
      {
         this._passedPassword = param1;
      }
   }
}

