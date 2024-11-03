package Renamed838
{
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.objects.tank.Renamed1049;
   
   public class Renamed839
   {
      public var collisionGroup:int;
      
      public var Renamed5782:Boolean = false;
      
      public var Renamed1299:RayHit;
      
      public var Renamed5787:Number = 0;
      
      public var speed:Number = 0;
      
      private var body:Body;
      
      private var origin:Vector3;
      
      private var direction:Vector3;
      
      private var Renamed983:Renamed911;
      
      private var Renamed5788:Vector3;
      
      private var Renamed5789:Vector3;
      
      private var Renamed5790:Number = 0;
      
      private var Renamed3107:Renamed3031;
      
      public function Renamed839(param1:Body, param2:Vector3, param3:Vector3, param4:Renamed911)
      {
         this.Renamed5784 = new Vector3();
         this.Renamed1299 = new RayHit();
         this.origin = new Vector3();
         this.direction = new Vector3();
         this.Renamed5788 = new Vector3();
         this.Renamed5789 = new Vector3();
         super();
         this.body = param1;
         this.origin.copy(param2);
         this.direction.copy(param3);
         this.Renamed983 = param4;
         this.Renamed3107 = new Renamed3031(param1);
      }
      
      public function update(param1:Number) : void
      {
         this.raycast();
         if(this.Renamed5782)
         {
            this.Renamed5791(param1);
            this.Renamed5792();
         }
      }
      
      private function raycast() : void
      {
         var _loc1_:Matrix3 = this.body.baseMatrix;
         this.Renamed5789.x = _loc1_.m00 * this.direction.x + _loc1_.m01 * this.direction.y + _loc1_.m02 * this.direction.z;
         this.Renamed5789.y = _loc1_.m10 * this.direction.x + _loc1_.m11 * this.direction.y + _loc1_.m12 * this.direction.z;
         this.Renamed5789.z = _loc1_.m20 * this.direction.x + _loc1_.m21 * this.direction.y + _loc1_.m22 * this.direction.z;
         var _loc2_:Vector3 = this.body.state.position;
         this.Renamed5788.x = _loc1_.m00 * this.origin.x + _loc1_.m01 * this.origin.y + _loc1_.m02 * this.origin.z;
         this.Renamed5788.y = _loc1_.m10 * this.origin.x + _loc1_.m11 * this.origin.y + _loc1_.m12 * this.origin.z;
         this.Renamed5788.z = _loc1_.m20 * this.origin.x + _loc1_.m21 * this.origin.y + _loc1_.m22 * this.origin.z;
         this.Renamed5788.x += _loc2_.x;
         this.Renamed5788.y += _loc2_.y;
         this.Renamed5788.z += _loc2_.z;
         if(this.Renamed5782)
         {
            this.Renamed5790 = this.Renamed983.Renamed5777 - this.Renamed1299.t;
         }
         this.Renamed5782 = this.body.scene.collisionDetector.raycast(this.Renamed5788,this.Renamed5789,this.collisionGroup,this.Renamed983.Renamed5777,this.Renamed3107,this.Renamed1299);
         if(this.Renamed5782)
         {
            this.Renamed5782 = this.Renamed1299.normal.z > Renamed1049.Renamed1166;
         }
      }
      
      public function Renamed5791(param1:Number) : void
      {
         var _loc2_:Number = this.Renamed983.Renamed5777 - this.Renamed1299.t;
         this.Renamed5787 = this.Renamed983.Renamed5776 * _loc2_;
         var _loc3_:Number = (_loc2_ - this.Renamed5790) / param1;
         this.Renamed5787 += _loc3_ * this.Renamed983.dampingCoeff;
         if(this.Renamed5787 < 0)
         {
            this.Renamed5787 = 0;
         }
      }
      
      private function Renamed5792() : void
      {
         var _loc1_:Vector3 = null;
         var _loc2_:Vector3 = null;
         var _loc3_:Vector3 = null;
         var _loc4_:Vector3 = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Body = this.Renamed1299.shape.body;
         if(_loc8_.tank != null)
         {
            _loc1_ = _loc8_.state.position;
            _loc2_ = _loc8_.state.velocity;
            _loc3_ = _loc8_.state.angularVelocity;
            _loc4_ = this.Renamed1299.position;
            _loc5_ = _loc4_.x - _loc1_.x;
            _loc6_ = _loc4_.y - _loc1_.y;
            _loc7_ = _loc4_.z - _loc1_.z;
            this.Renamed5784.x = _loc3_.y * _loc7_ - _loc3_.z * _loc6_;
            this.Renamed5784.y = _loc3_.z * _loc5_ - _loc3_.x * _loc7_;
            this.Renamed5784.z = _loc3_.x * _loc6_ - _loc3_.y * _loc5_;
            this.Renamed5784.x += _loc2_.x;
            this.Renamed5784.y += _loc2_.y;
            this.Renamed5784.z += _loc2_.z;
         }
         else
         {
            this.Renamed5784.x = 0;
            this.Renamed5784.y = 0;
            this.Renamed5784.z = 0;
         }
      }
      
      public function Renamed862() : Vector3
      {
         return this.Renamed5788;
      }
      
      public function Renamed5793() : Vector3
      {
         return this.Renamed5789;
      }
      
      public function Renamed5785() : Vector3
      {
         return this.origin;
      }
   }
}

