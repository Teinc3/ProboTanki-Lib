package Renamed326
{
   import Renamed602.Renamed603;
   
   public class Renamed7757
   {
      private var Renamed7758:Boolean;
      
      private var Renamed7759:String;
      
      private var Renamed7760:String;
      
      private var _position:Renamed603;
      
      public function Renamed7757(param1:Boolean = false, param2:String = null, param3:String = null, param4:Renamed603 = null)
      {
         super();
         this.Renamed7758 = param1;
         this.Renamed7759 = param2;
         this.Renamed7760 = param3;
         this._position = param4;
      }
      
      public function get activated() : Boolean
      {
         return this.Renamed7758;
      }
      
      public function set activated(param1:Boolean) : void
      {
         this.Renamed7758 = param1;
      }
      
      public function get mineId() : String
      {
         return this.Renamed7759;
      }
      
      public function set mineId(param1:String) : void
      {
         this.Renamed7759 = param1;
      }
      
      public function get ownerId() : String
      {
         return this.Renamed7760;
      }
      
      public function set ownerId(param1:String) : void
      {
         this.Renamed7760 = param1;
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
         var _loc1_:String = "BattleMine [";
         _loc1_ += "activated = " + this.activated + " ";
         _loc1_ += "mineId = " + this.mineId + " ";
         _loc1_ += "ownerId = " + this.ownerId + " ";
         _loc1_ += "position = " + this.position + " ";
         return _loc1_ + "]";
      }
   }
}

