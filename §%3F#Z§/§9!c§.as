package §?#Z§
{
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.objects.tank.§native catch var§;
   
   public class §9!c§
   {
      public var collisionGroup:int;
      
      public var §="§:Boolean = false;
      
      public var §extends const default§:RayHit;
      
      public var §5U§:Number = 0;
      
      public var speed:Number = 0;
      
      private var body:Body;
      
      private var origin:Vector3;
      
      private var direction:Vector3;
      
      private var §import set switch§:§`#T§;
      
      private var §do const try§:Vector3;
      
      private var §for set var§:Vector3;
      
      private var §var set include§:Number = 0;
      
      private var §3!<§:§4"z§;
      
      public function §9!c§(param1:Body, param2:Vector3, param3:Vector3, param4:§`#T§)
      {
         this.§`"`§ = new Vector3();
         this.§extends const default§ = new RayHit();
         this.origin = new Vector3();
         this.direction = new Vector3();
         this.§do const try§ = new Vector3();
         this.§for set var§ = new Vector3();
         super();
         this.body = param1;
         this.origin.copy(param2);
         this.direction.copy(param3);
         this.§import set switch§ = param4;
         this.§3!<§ = new §4"z§(param1);
      }
      
      public function update(param1:Number) : void
      {
         this.raycast();
         if(this.§="§)
         {
            this.§continue package implements§(param1);
            this.§1!<§();
         }
      }
      
      private function raycast() : void
      {
         var _loc1_:Matrix3 = this.body.baseMatrix;
         this.§for set var§.x = _loc1_.m00 * this.direction.x + _loc1_.m01 * this.direction.y + _loc1_.m02 * this.direction.z;
         this.§for set var§.y = _loc1_.m10 * this.direction.x + _loc1_.m11 * this.direction.y + _loc1_.m12 * this.direction.z;
         this.§for set var§.z = _loc1_.m20 * this.direction.x + _loc1_.m21 * this.direction.y + _loc1_.m22 * this.direction.z;
         var _loc2_:Vector3 = this.body.state.position;
         this.§do const try§.x = _loc1_.m00 * this.origin.x + _loc1_.m01 * this.origin.y + _loc1_.m02 * this.origin.z;
         this.§do const try§.y = _loc1_.m10 * this.origin.x + _loc1_.m11 * this.origin.y + _loc1_.m12 * this.origin.z;
         this.§do const try§.z = _loc1_.m20 * this.origin.x + _loc1_.m21 * this.origin.y + _loc1_.m22 * this.origin.z;
         this.§do const try§.x += _loc2_.x;
         this.§do const try§.y += _loc2_.y;
         this.§do const try§.z += _loc2_.z;
         if(this.§="§)
         {
            this.§var set include§ = this.§import set switch§.§true package native§ - this.§extends const default§.t;
         }
         this.§="§ = this.body.scene.collisionDetector.raycast(this.§do const try§,this.§for set var§,this.collisionGroup,this.§import set switch§.§true package native§,this.§3!<§,this.§extends const default§);
         if(this.§="§)
         {
            this.§="§ = this.§extends const default§.normal.z > §native catch var§.§7!b§;
         }
      }
      
      public function §continue package implements§(param1:Number) : void
      {
         var _loc2_:Number = this.§import set switch§.§true package native§ - this.§extends const default§.t;
         this.§5U§ = this.§import set switch§.§?1§ * _loc2_;
         var _loc3_:Number = (_loc2_ - this.§var set include§) / param1;
         this.§5U§ += _loc3_ * this.§import set switch§.dampingCoeff;
         if(this.§5U§ < 0)
         {
            this.§5U§ = 0;
         }
      }
      
      private function §1!<§() : void
      {
         var _loc1_:Vector3 = null;
         var _loc2_:Vector3 = null;
         var _loc3_:Vector3 = null;
         var _loc4_:Vector3 = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Body = this.§extends const default§.shape.body;
         if(_loc8_.tank != null)
         {
            _loc1_ = _loc8_.state.position;
            _loc2_ = _loc8_.state.velocity;
            _loc3_ = _loc8_.state.angularVelocity;
            _loc4_ = this.§extends const default§.position;
            _loc5_ = _loc4_.x - _loc1_.x;
            _loc6_ = _loc4_.y - _loc1_.y;
            _loc7_ = _loc4_.z - _loc1_.z;
            this.§`"`§.x = _loc3_.y * _loc7_ - _loc3_.z * _loc6_;
            this.§`"`§.y = _loc3_.z * _loc5_ - _loc3_.x * _loc7_;
            this.§`"`§.z = _loc3_.x * _loc6_ - _loc3_.y * _loc5_;
            this.§`"`§.x += _loc2_.x;
            this.§`"`§.y += _loc2_.y;
            this.§`"`§.z += _loc2_.z;
         }
         else
         {
            this.§`"`§.x = 0;
            this.§`"`§.y = 0;
            this.§`"`§.z = 0;
         }
      }
      
      public function §5!o§() : Vector3
      {
         return this.§do const try§;
      }
      
      public function §package package native§() : Vector3
      {
         return this.§for set var§;
      }
      
      public function §6"6§() : Vector3
      {
         return this.origin;
      }
   }
}

