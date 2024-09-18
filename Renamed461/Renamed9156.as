package Renamed461
{
   import Renamed602.Renamed603;
   
   public class Renamed2772
   {
      private var Renamed9153:Renamed603;
      
      private var Renamed9154:int;
      
      private var Renamed9155:Renamed603;
      
      private var Renamed2827:Renamed603;
      
      private var _position:Renamed603;
      
      public function Renamed2772(param1:Renamed603 = null, param2:int = 0, param3:Renamed603 = null, param4:Renamed603 = null, param5:Renamed603 = null)
      {
         super();
         this.Renamed9153 = param1;
         this.Renamed9154 = param2;
         this.Renamed9155 = param3;
         this.Renamed2827 = param4;
         this._position = param5;
      }
      
      public function get angularVelocity() : Renamed603
      {
         return this.Renamed9153;
      }
      
      public function set angularVelocity(param1:Renamed603) : void
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
      
      public function get Renamed2904() : Renamed603
      {
         return this.Renamed9155;
      }
      
      public function set Renamed2904(param1:Renamed603) : void
      {
         this.Renamed9155 = param1;
      }
      
      public function get orientation() : Renamed603
      {
         return this.Renamed2827;
      }
      
      public function set orientation(param1:Renamed603) : void
      {
         this.Renamed2827 = param1;
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

