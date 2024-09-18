package Renamed4594
{
   import Renamed602.Renamed603;
   
   public class Renamed6340
   {
      private var _id:int;
      
      private var _position:Renamed603;
      
      public function Renamed6340(param1:int = 0, param2:Renamed603 = null)
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
         var _loc1_:String = "AssaultBase [";
         _loc1_ += "id = " + this.id + " ";
         _loc1_ += "position = " + this.position + " ";
         return _loc1_ + "]";
      }
   }
}

