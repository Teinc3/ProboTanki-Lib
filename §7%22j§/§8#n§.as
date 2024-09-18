package §7"j§
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.physics.collision.CollisionDetector;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.camera.§3!0§;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   import §for set super§.§super const continue§;
   
   public class §8#n§ extends §["D§ implements §super const class§
   {
      private static const §with const false§:Matrix4 = new Matrix4();
      
      private static const §if package var§:Vector3 = new Vector3();
      
      private static const direction:Vector3 = new Vector3();
      
      private static const §`#V§:Vector3 = new Vector3();
      
      private static const §continue set static§:Vector3 = new Vector3();
      
      private static const intersection:RayHit = new RayHit();
      
      private static const §3z§:Number = 20;
      
      private static const §true var false§:Number = 0.2;
      
      private var §1#0§:Number;
      
      private var collisionDetector:CollisionDetector;
      
      private var §%#a§:Vector3;
      
      private var turret:Object3D;
      
      private var coeff:Number;
      
      private var §0Q§:Number = 0;
      
      public function §8#n§(param1:§1Q§)
      {
         this.§%#a§ = new Vector3();
         super(param1);
      }
      
      private function §=#E§() : void
      {
         §with const false§.setMatrix(this.turret.x,this.turret.y,this.turret.z,this.turret.rotationX,this.turret.rotationY,this.turret.rotationZ);
         §`#V§.x = §with const false§.m00;
         §`#V§.y = §with const false§.m10;
         §`#V§.z = §with const false§.m20;
         direction.x = §with const false§.m01;
         direction.y = §with const false§.m11;
         direction.z = §with const false§.m21;
         §with const false§.transformVector(this.§%#a§,§continue set static§);
         var _loc1_:Number = this.§%#a§.y;
         §if package var§.x = §continue set static§.x - _loc1_ * direction.x;
         §if package var§.y = §continue set static§.y - _loc1_ * direction.y;
         §if package var§.z = §continue set static§.z - _loc1_ * direction.z;
      }
      
      public function init(param1:Object3D, param2:Vector3, param3:CollisionDetector, param4:Number, param5:Number = 0.5) : void
      {
         this.turret = param1;
         this.§%#a§ = param2;
         this.collisionDetector = param3;
         this.§1#0§ = param4;
         this.coeff = param5;
         this.§0Q§ = 0;
      }
      
      public function §do package use§(param1:Object3D) : void
      {
         this.§=#E§();
         var _loc2_:Number = this.§1#0§ * this.coeff;
         if(this.collisionDetector.raycastStatic(§if package var§,direction,§super const continue§.§finally catch while§,this.§1#0§,null,intersection))
         {
            _loc2_ = Vector3.distanceBetween(§if package var§,intersection.position) * this.coeff;
         }
         var _loc3_:Number = _loc2_ - this.§0Q§;
         if(Math.abs(_loc3_) <= §3z§)
         {
            this.§0Q§ = _loc2_;
         }
         else
         {
            this.§0Q§ += _loc3_ * §true var false§;
         }
         param1.x = §if package var§.x + direction.x * this.§0Q§;
         param1.y = §if package var§.y + direction.y * this.§0Q§;
         param1.z = §if package var§.z + direction.z * this.§0Q§;
      }
      
      public function §'!g§(param1:Object3D, param2:§3!0§, param3:int) : void
      {
         this.§do package use§(param1);
      }
      
      public function destroy() : void
      {
         this.turret = null;
         this.collisionDetector = null;
         recycle();
      }
   }
}

