package Renamed4594
{
   import Renamed602.3DPositionVector;
   
   public class Renamed6340
   {
      private var _id:int;
      
      private var _position:3DPositionVector;
      
      public function Renamed6340(param1:int = 0, param2:3DPositionVector = null)
      {
         super();
         this._id = param1;
         this._position = param2;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
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
         var _loc1_:String = "AssaultBase [";
         _loc1_ += "id = " + this.id + " ";
         _loc1_ += "position = " + this.position + " ";
         return _loc1_ + "]";
      }
   }
}

