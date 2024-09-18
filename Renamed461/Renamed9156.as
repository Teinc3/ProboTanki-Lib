package Renamed461
{
   import Renamed602.3DPositionVector;
   
   public class Renamed2772
   {
      private var Renamed9153:3DPositionVector;
      
      private var Renamed9154:int;
      
      private var Renamed9155:3DPositionVector;
      
      private var Renamed2827:3DPositionVector;
      
      private var _position:3DPositionVector;
      
      public function Renamed2772(param1:3DPositionVector = null, param2:int = 0, param3:3DPositionVector = null, param4:3DPositionVector = null, param5:3DPositionVector = null)
      {
         super();
         this.Renamed9153 = param1;
         this.Renamed9154 = param2;
         this.Renamed9155 = param3;
         this.Renamed2827 = param4;
         this._position = param5;
      }
      
      public function get angularVelocity() : 3DPositionVector
      {
         return this.Renamed9153;
      }
      
      public function set angularVelocity(param1:3DPositionVector) : void
      {
         this.Renamed9153 = param1;
      }
      
      public function get control() : int
      {
         return this.Renamed9154;
      }
      
      public function set control(param1:int) : void
      {
         this.Renamed9154 = param1;
      }
      
      public function get Renamed2904() : 3DPositionVector
      {
         return this.Renamed9155;
      }
      
      public function set Renamed2904(param1:3DPositionVector) : void
      {
         this.Renamed9155 = param1;
      }
      
      public function get orientation() : 3DPositionVector
      {
         return this.Renamed2827;
      }
      
      public function set orientation(param1:3DPositionVector) : void
      {
         this.Renamed2827 = param1;
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
         var _loc1_:String = "MoveCommand [";
         _loc1_ += "angularVelocity = " + this.angularVelocity + " ";
         _loc1_ += "control = " + this.control + " ";
         _loc1_ += "linearVelocity = " + this.Renamed2904 + " ";
         _loc1_ += "orientation = " + this.orientation + " ";
         _loc1_ += "position = " + this.position + " ";
         return _loc1_ + "]";
      }
   }
}

