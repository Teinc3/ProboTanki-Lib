package §7"j§
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.§3!0§;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   
   public class §<#z§ extends §["D§ implements §super const class§
   {
      private var §`"=§:Vector3;
      
      private var velocity:Vector3;
      
      private var §switch set if§:Number;
      
      public function §<#z§(param1:§1Q§)
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
         param1.scaleX = 1;
         param1.scaleY = 1;
         param1.scaleZ = 1;
      }
      
      public function init(param1:Vector3, param2:Vector3, param3:Number) : void
      {
         this.§`"=§.copy(param1);
         this.velocity.copy(param2);
         this.§switch set if§ = param3;
      }
      
      public function §'!g§(param1:Object3D, param2:§3!0§, param3:int) : void
      {
         var _loc4_:Number = 0.001 * param3;
         param1.x += this.velocity.x * _loc4_;
         param1.y += this.velocity.y * _loc4_;
         param1.z += this.velocity.z * _loc4_;
         param1.scaleX += this.§switch set if§;
         param1.scaleY += this.§switch set if§;
         param1.scaleZ += this.§switch set if§;
      }
      
      public function destroy() : void
      {
         recycle();
      }
   }
}

