package Renamed349
{
   import Renamed602.Renamed603;
   import alternativa.object.ClientObject;
   
   public class Renamed3105
   {
      private var _direction:Renamed603;
      
      private var Renamed4166:Renamed603;
      
      private var Renamed8073:int;
      
      private var _target:ClientObject;
      
      public function Renamed3105(param1:Renamed603 = null, param2:Renamed603 = null, param3:int = 0, param4:ClientObject = null)
      {
         super();
         this._direction = param1;
         this.Renamed4166 = param2;
         this.Renamed8073 = param3;
         this._target = param4;
      }
      
      public function get direction() : Renamed603
      {
         return this._direction;
      }
      
      public function set direction(param1:Renamed603) : void
      {
         this._direction = param1;
      }
      
      public function get Renamed3116() : Renamed603
      {
         return this.Renamed4166;
      }
      
      public function set Renamed3116(param1:Renamed603) : void
      {
         this.Renamed4166 = param1;
      }
      
      public function get Renamed3448() : int
      {
         return this.Renamed8073;
      }
      
      public function set Renamed3448(param1:int) : void
      {
         this.Renamed8073 = param1;
      }
      
      public function get target() : ClientObject
      {
         return this._target;
      }
      
      public function set target(param1:ClientObject) : void
      {
         this._target = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "TargetHit [";
         _loc1_ += "direction = " + this.direction + " ";
         _loc1_ += "localHitPoint = " + this.Renamed3116 + " ";
         _loc1_ += "numberHits = " + this.Renamed3448 + " ";
         _loc1_ += "target = " + this.target + " ";
         return _loc1_ + "]";
      }
   }
}

