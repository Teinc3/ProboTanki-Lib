package projects.tanks.client.battlefield.models.tankparts.weapons.common
{
   import Renamed602.3DPositionVector;
   import alternativa.object.ClientObject;
   
   public class Renamed667
   {
      private var _direction:3DPositionVector;
      
      private var _localHitPoint:3DPositionVector;
      
      private var Renamed2827:3DPositionVector;
      
      private var _position:3DPositionVector;
      
      private var _target:ClientObject;
      
      private var Renamed4167:Number;
      
      public function Renamed667(param1:3DPositionVector = null, param2:3DPositionVector = null, param3:ClientObject = null, param4:Number = 0, param5:3DPositionVector = null, param6:3DPositionVector = null)
      {
         super();
         this.Renamed2827 = param1;
         this._position = param2;
         this._target = param3;
         this.Renamed4167 = param4;
         this._localHitPoint = param5;
         this._direction = param6;
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
      
      public function get target() : ClientObject
      {
         return this._target;
      }
      
      public function set target(param1:ClientObject) : void
      {
         this._target = param1;
      }
      
      public function get turretAngle() : Number
      {
         return this.Renamed4167;
      }
      
      public function set turretAngle(param1:Number) : void
      {
         this.Renamed4167 = param1;
      }
      
      public function get localHitPoint() : 3DPositionVector
      {
         return this._localHitPoint;
      }
      
      public function set localHitPoint(param1:3DPositionVector) : void
      {
         this._localHitPoint = param1;
      }
      
      public function get direction() : 3DPositionVector
      {
         return this._direction;
      }
      
      public function set direction(param1:3DPositionVector) : void
      {
         this._direction = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "TargetPosition [";
         _loc1_ += "orientation = " + this.orientation + " ";
         _loc1_ += "position = " + this.position + " ";
         _loc1_ += "target = " + this.target + " ";
         _loc1_ += "turretAngle = " + this.turretAngle + " ";
         _loc1_ += "localHitPoint = " + this.localHitPoint + " ";
         _loc1_ += "direction = " + this.direction + " ";
         return _loc1_ + "]";
      }
   }
}

