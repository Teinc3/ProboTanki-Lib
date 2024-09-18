package §7"j§
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.§3!0§;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   
   public class §with each§ extends §["D§ implements §super const class§
   {
      private var §`"=§:Vector3;
      
      private var velocity:Vector3;
      
      private var acceleration:Number;
      
      public function §with each§(param1:§1Q§)
      {
         this.§`"=§ = new Vector3();
         this.velocity = new Vector3();
         super(param1);
      }
      
      public function §do package use§(param1:Object3D) : void
      {
         param1.x = this.§`"=§.x;
         param1.y = this.§`"=§.y;
         param1.z = this.§`"=§.z;
      }
      
      public function init(param1:Vector3, param2:Vector3, param3:Number) : void
      {
         this.§`"=§.copy(param1);
         this.velocity.copy(param2);
         this.acceleration = param3;
      }
      
      public function §'!g§(param1:Object3D, param2:§3!0§, param3:int) : void
      {
         var _loc4_:Number = NaN;
         _loc4_ = 0.001 * param3;
         param1.x += this.velocity.x * _loc4_;
         param1.y += this.velocity.y * _loc4_;
         param1.z += this.velocity.z * _loc4_;
         var _loc5_:Number = this.velocity.length();
         if((_loc5_ = _loc5_ + this.acceleration * _loc4_) <= 0)
         {
            this.velocity.reset();
         }
         else
         {
            this.velocity.normalize();
            this.velocity.scale(_loc5_);
         }
      }
      
      public function destroy() : void
      {
         recycle();
      }
   }
}

