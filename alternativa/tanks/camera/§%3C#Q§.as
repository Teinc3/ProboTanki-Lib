package alternativa.tanks.camera
{
   import alternativa.math.Vector3;
   import alternativa.tanks.utils.MathUtils;
   
   public class §<#Q§ extends §#X§ implements §function const package§
   {
      private static const §0!>§:Number = 3000;
      
      private static const §for package function§:Vector3 = new Vector3();
      
      private var p1:Vector3;
      
      private var p2:Vector3;
      
      private var §0!T§:Vector3;
      
      private var §&@§:Vector3;
      
      private var §function catch with§:Number;
      
      private var distance:Number;
      
      private var acceleration:Number;
      
      private var speed:Number;
      
      private var §1"N§:§if set catch§;
      
      private var §#"f§:§if set catch§;
      
      public var duration:int;
      
      public function §<#Q§(param1:int)
      {
         this.p1 = new Vector3();
         this.p2 = new Vector3();
         this.§0!T§ = new Vector3();
         this.§&@§ = new Vector3();
         this.§1"N§ = new §if set catch§();
         this.§#"f§ = new §if set catch§();
         super();
         this.duration = param1;
      }
      
      public function init(param1:Vector3, param2:Vector3) : void
      {
         this.p1.copy(§7#[§());
         this.p2.copy(this.p1);
         this.§&@§.copy(param1);
         this.§0!T§.copy(this.§&@§);
         this.p2.z = this.§0!T§.z = (this.p1.z > this.§&@§.z ? this.p1.z : this.§&@§.z) + §0!>§;
         var _loc3_:Number = 4000000 / (this.duration * this.duration);
         this.§1"N§.init(MathUtils.clampAngle(§for package catch§()),param2.x,_loc3_);
         this.§#"f§.init(MathUtils.clampAngle(§false package static§()),param2.z,_loc3_);
         var _loc4_:Vector3 = new Vector3();
         _loc4_.diff(this.§&@§,this.p1);
         this.§function catch with§ = _loc4_.length();
         this.acceleration = this.§function catch with§ * _loc3_;
         this.distance = 0;
         this.speed = 0;
      }
      
      override public function update(param1:int, param2:int) : void
      {
         if(this.speed < 0)
         {
            return;
         }
         if(this.distance > 0.5 * this.§function catch with§ && this.acceleration > 0)
         {
            this.acceleration = -this.acceleration;
            this.§1"N§.reverseAcceleration();
            this.§#"f§.reverseAcceleration();
         }
         var _loc3_:Number = 0.001 * param2;
         var _loc4_:Number = this.acceleration * _loc3_;
         this.distance += (this.speed + 0.5 * _loc4_) * _loc3_;
         this.speed += _loc4_;
         if(this.distance > this.§function catch with§)
         {
            this.distance = this.§function catch with§;
         }
         this.§throw var null§(this.distance / this.§function catch with§,this.p1,this.p2,this.§0!T§,this.§&@§,§for package function§);
         setPosition(§for package function§);
         §2#1§(this.§1"N§.update(_loc3_),0,this.§#"f§.update(_loc3_));
      }
      
      private function §throw var null§(param1:Number, param2:Vector3, param3:Vector3, param4:Vector3, param5:Vector3, param6:Vector3) : void
      {
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = 1 - param1;
         _loc7_ = _loc9_ * _loc9_;
         var _loc10_:Number = 3 * param1 * _loc7_;
         _loc7_ *= _loc9_;
         _loc8_ = param1 * param1;
         var _loc11_:Number = 3 * _loc8_ * _loc9_;
         _loc8_ *= param1;
         param6.x = _loc7_ * param2.x + _loc10_ * param3.x + _loc11_ * param4.x + _loc8_ * param5.x;
         param6.y = _loc7_ * param2.y + _loc10_ * param3.y + _loc11_ * param4.y + _loc8_ * param5.y;
         param6.z = _loc7_ * param2.z + _loc10_ * param3.z + _loc11_ * param4.z + _loc8_ * param5.z;
      }
   }
}

