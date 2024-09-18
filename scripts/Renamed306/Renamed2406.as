package Renamed306
{
   public class Renamed2406
   {
      private var _alpha:Number;
      
      private var _color:int;
      
      private var Renamed7566:Number;
      
      private var Renamed7567:Number;
      
      public function Renamed2406(param1:Number = 0, param2:int = 0, param3:Number = 0, param4:Number = 0)
      {
         super();
         this._alpha = param1;
         this._color = param2;
         this.Renamed7566 = param3;
         this.Renamed7567 = param4;
      }
      
      public function get alpha() : Number
      {
         return this._alpha;
      }
      
      public function set alpha(param1:Number) : void
      {
         this._alpha = param1;
      }
      
      public function get color() : int
      {
         return this._color;
      }
      
      public function set color(param1:int) : void
      {
         this._color = param1;
      }
      
      public function get farLimit() : Number
      {
         return this.Renamed7566;
      }
      
      public function set farLimit(param1:Number) : void
      {
         this.Renamed7566 = param1;
      }
      
      public function get nearLimit() : Number
      {
         return this.Renamed7567;
      }
      
      public function set nearLimit(param1:Number) : void
      {
         this.Renamed7567 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "FogParams [";
         _loc1_ += "alpha = " + this.alpha + " ";
         _loc1_ += "color = " + this.color + " ";
         _loc1_ += "farLimit = " + this.farLimit + " ";
         _loc1_ += "nearLimit = " + this.nearLimit + " ";
         return _loc1_ + "]";
      }
   }
}

