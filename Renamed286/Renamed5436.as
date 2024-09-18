package Renamed4611
{
   import Renamed602.Renamed603;
   
   public class Renamed5436
   {
      private var Renamed6773:Renamed603;
      
      private var Renamed6774:String;
      
      private var Renamed6775:Renamed603;
      
      public function Renamed5436(param1:Renamed603 = null, param2:String = null, param3:Renamed603 = null)
      {
         super();
         this.Renamed6773 = param1;
         this.Renamed6774 = param2;
         this.Renamed6775 = param3;
      }
      
      public function get Renamed5499() : Renamed603
      {
         return this.Renamed6773;
      }
      
      public function set Renamed5499(param1:Renamed603) : void
      {
         this.Renamed6773 = param1;
      }
      
      public function get Renamed5500() : String
      {
         return this.Renamed6774;
      }
      
      public function set Renamed5500(param1:String) : void
      {
         this.Renamed6774 = param1;
      }
      
      public function get Renamed5406() : Renamed603
      {
         return this.Renamed6775;
      }
      
      public function set Renamed5406(param1:Renamed603) : void
      {
         this.Renamed6775 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ClientFlag [";
         _loc1_ += "flagBasePosition = " + this.Renamed5499 + " ";
         _loc1_ += "flagCarrierId = " + this.Renamed5500 + " ";
         _loc1_ += "flagPosition = " + this.Renamed5406 + " ";
         return _loc1_ + "]";
      }
   }
}

