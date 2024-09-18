package Renamed481
{
   import Renamed602.3DPositionVector;
   
   public class Renamed5179
   {
      private var Renamed9531:int;
      
      private var _direction:3DPositionVector;
      
      private var _position:3DPositionVector;
      
      public function Renamed5179(param1:int = 0, param2:3DPositionVector = null, param3:3DPositionVector = null)
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
      
      public function get direction() : 3DPositionVector
      {
         return this._direction;
      }
      
      public function set direction(param1:3DPositionVector) : void
      {
         this._direction = param1;
      }
      
      public function get position() : 3DPositionVector
      {
         return this._position;
      }
      
      public function set position(param1:3DPositionVector) : void
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

