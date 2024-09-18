package projects.tanks.client.battlefield.models.tankparts.weapons.common
{
   import §;"?§.§#">§;
   import alternativa.object.ClientObject;
   
   public class §default for break§
   {
      private var _direction:§#">§;
      
      private var §]"t§:§#">§;
      
      private var §default for switch§:§#">§;
      
      private var _position:§#">§;
      
      private var _target:ClientObject;
      
      private var §include with§:Number;
      
      public function §default for break§(param1:§#">§ = null, param2:§#">§ = null, param3:ClientObject = null, param4:Number = 0, param5:§#">§ = null, param6:§#">§ = null)
      {
         super();
         this.§default for switch§ = param1;
         this._position = param2;
         this._target = param3;
         this.§include with§ = param4;
         this.§]"t§ = param5;
         this._direction = param6;
      }
      
      public function get orientation() : §#">§
      {
         return this.§default for switch§;
      }
      
      public function set orientation(param1:§#">§) : void
      {
         this.§default for switch§ = param1;
      }
      
      public function get position() : §#">§
      {
         return this._position;
      }
      
      public function set position(param1:§#">§) : void
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
         return this.§include with§;
      }
      
      public function set turretAngle(param1:Number) : void
      {
         this.§include with§ = param1;
      }
      
      public function get §package var true§() : §#">§
      {
         return this.§]"t§;
      }
      
      public function set §package var true§(param1:§#">§) : void
      {
         this.§]"t§ = param1;
      }
      
      public function get direction() : §#">§
      {
         return this._direction;
      }
      
      public function set direction(param1:§#">§) : void
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
         _loc1_ += "localHitPoint = " + this.§package var true§ + " ";
         _loc1_ += "direction = " + this.direction + " ";
         return _loc1_ + "]";
      }
   }
}

