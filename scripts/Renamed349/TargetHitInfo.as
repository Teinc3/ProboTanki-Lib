package Renamed349
{
   import Renamed602.3DPositionVector;
   import alternativa.object.ClientObject;
   
   public class TargetHitInfo
   {
      private var _direction:3DPositionVector;
      
      private var _localHitPoint:3DPositionVector;
      
      private var _numberHits:int;
      
      private var _target:ClientObject;
      
      public function TargetHitInfo(param1:3DPositionVector = null, param2:3DPositionVector = null, param3:int = 0, param4:ClientObject = null)
      {
         super();
         this._direction = param1;
         this._localHitPoint = param2;
         this._numberHits = param3;
         this._target = param4;
      }
      
      public function get direction() : 3DPositionVector
      {
         return this._direction;
      }
      
      public function set direction(param1:3DPositionVector) : void
      {
         this._direction = param1;
      }
      
      public function get localHitPoint() : 3DPositionVector
      {
         return this._localHitPoint;
      }
      
      public function set localHitPoint(param1:3DPositionVector) : void
      {
         this._localHitPoint = param1;
      }
      
      public function get numberHits() : int
      {
         return this._numberHits;
      }
      
      public function set numberHits(param1:int) : void
      {
         this._numberHits = param1;
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
         _loc1_ += "localHitPoint = " + this.localHitPoint + " ";
         _loc1_ += "numberHits = " + this.numberHits + " ";
         _loc1_ += "target = " + this.target + " ";
         return _loc1_ + "]";
      }
   }
}

