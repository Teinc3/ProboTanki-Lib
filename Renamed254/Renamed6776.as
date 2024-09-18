package Renamed4594
{
   import Renamed602.Renamed603;
   
   public class Renamed6342
   {
      private var Renamed6773:Renamed603;
      
      private var Renamed6774:String;
      
      private var Renamed6775:Renamed603;
      
      private var _id:int;
      
      public function Renamed6342(param1:Renamed603 = null, param2:String = null, param3:Renamed603 = null, param4:int = 0)
      {
         super();
         this.Renamed6773 = param1;
         this.Renamed6774 = param2;
         this.Renamed6775 = param3;
         this._id = param4;
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
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ClientAssaultFlag [";
         _loc1_ += "flagBasePosition = " + this.Renamed5499 + " ";
         _loc1_ += "flagCarrierId = " + this.Renamed5500 + " ";
         _loc1_ += "flagPosition = " + this.Renamed5406 + " ";
         _loc1_ += "id = " + this.id + " ";
         return _loc1_ + "]";
      }
   }
}

