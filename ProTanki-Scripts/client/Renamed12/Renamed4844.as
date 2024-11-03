package Renamed12
{
   public class Renamed13
   {
      private var Renamed4842:Number;
      
      private var Renamed4843:Number;
      
      public function Renamed13(param1:Number = 0, param2:Number = 0)
      {
         super();
         this.Renamed4842 = param1;
         this.Renamed4843 = param2;
      }
      
      public function get damageAreaConeAngle() : Number
      {
         return this.Renamed4842;
      }
      
      public function set damageAreaConeAngle(param1:Number) : void
      {
         this.Renamed4842 = param1;
      }
      
      public function get damageAreaRange() : Number
      {
         return this.Renamed4843;
      }
      
      public function set damageAreaRange(param1:Number) : void
      {
         this.Renamed4843 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "FreezeCC [";
         _loc1_ += "damageAreaConeAngle = " + this.damageAreaConeAngle + " ";
         _loc1_ += "damageAreaRange = " + this.damageAreaRange + " ";
         return _loc1_ + "]";
      }
   }
}

