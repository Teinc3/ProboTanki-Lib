package projects.tanks.client.battlefield.models.tankparts.weapons.common
{
   import Renamed602.Renamed603;
   import alternativa.object.ClientObject;
   
   public class Renamed667
   {
      private var _direction:Renamed603;
      
      private var Renamed4166:Renamed603;
      
      private var Renamed2827:Renamed603;
      
      private var _position:Renamed603;
      
      private var _target:ClientObject;
      
      private var Renamed4167:Number;
      
      public function Renamed667(param1:Renamed603 = null, param2:Renamed603 = null, param3:ClientObject = null, param4:Number = 0, param5:Renamed603 = null, param6:Renamed603 = null)
      {
         super();
         this.Renamed2827 = param1;
         this._position = param2;
         this._target = param3;
         this.Renamed4167 = param4;
         this.Renamed4166 = param5;
         this._direction = param6;
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
      
      public function get Renamed3116() : Renamed603
      {
         return this.Renamed4166;
      }
      
      public function set Renamed3116(param1:Renamed603) : void
      {
         this.Renamed4166 = param1;
      }
      
      public function get direction() : Renamed603
      {
         return this._direction;
      }
      
      public function set direction(param1:Renamed603) : void
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
         _loc1_ += "localHitPoint = " + this.Renamed3116 + " ";
         _loc1_ += "direction = " + this.direction + " ";
         return _loc1_ + "]";
      }
   }
}

