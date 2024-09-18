package Renamed481
{
   import Renamed602.Renamed603;
   
   public class Renamed5179
   {
      private var Renamed9531:int;
      
      private var _direction:Renamed603;
      
      private var _position:Renamed603;
      
      public function Renamed5179(param1:int = 0, param2:Renamed603 = null, param3:Renamed603 = null)
      {
         super();
         this.Renamed9531 = param1;
         this._direction = param2;
         this._position = param3;
      }
      
      public function get Renamed6864() : int
      {
         return this.Renamed9531;
      }
      
      public function set Renamed6864(param1:int) : void
      {
         this.Renamed9531 = param1;
      }
      
      public function get direction() : Renamed603
      {
         return this._direction;
      }
      
      public function set direction(param1:Renamed603) : void
      {
         this._direction = param1;
      }
      
      public function get position() : Renamed603
      {
         return this._position;
      }
      
      public function set position(param1:Renamed603) : void
      {
         this._position = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ShellState [";
         _loc1_ += "clientTime = " + this.Renamed6864 + " ";
         _loc1_ += "direction = " + this.direction + " ";
         _loc1_ += "position = " + this.position + " ";
         return _loc1_ + "]";
      }
   }
}

