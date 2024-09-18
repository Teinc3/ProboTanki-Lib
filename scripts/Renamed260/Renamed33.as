package Renamed31
{
   public class Renamed33
   {
      private var Renamed6808:Number;
      
      private var _range:Number;
      
      public function Renamed33(param1:Number = 0, param2:Number = 0)
      {
         super();
         this.Renamed6808 = param1;
         this._range = param2;
      }
      
      public function get coneAngle() : Number
      {
         return this.Renamed6808;
      }
      
      public function set coneAngle(param1:Number) : void
      {
         this.Renamed6808 = param1;
      }
      
      public function get range() : Number
      {
         return this._range;
      }
      
      public function set range(param1:Number) : void
      {
         this._range = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "FlameThrowerCC [";
         _loc1_ += "coneAngle = " + this.coneAngle + " ";
         _loc1_ += "range = " + this.range + " ";
         return _loc1_ + "]";
      }
   }
}

