package Renamed245
{
   public class Renamed6624
   {
      private var _email:String;
      
      private var Renamed6625:Boolean;
      
      public function Renamed6624(param1:String = null, param2:Boolean = false)
      {
         super();
         this._email = param1;
         this.Renamed6625 = param2;
      }
      
      public function get email() : String
      {
         return this._email;
      }
      
      public function set email(param1:String) : void
      {
         this._email = param1;
      }
      
      public function get emailConfirmed() : Boolean
      {
         return this.Renamed6625;
      }
      
      public function set emailConfirmed(param1:Boolean) : void
      {
         this.Renamed6625 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "UserEmailCC [";
         _loc1_ += "email = " + this.email + " ";
         _loc1_ += "emailConfirmed = " + this.emailConfirmed + " ";
         return _loc1_ + "]";
      }
   }
}

