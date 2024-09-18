package §7"j§
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.§3!0§;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   
   public class §extends super§ extends §["D§ implements §super const class§
   {
      private static const §with const false§:Matrix4 = new Matrix4();
      
      private static const §"M§:Vector3 = new Vector3();
      
      private var turret:Object3D;
      
      private var §%#V§:Vector3;
      
      public function §extends super§(param1:§1Q§)
      {
         this.§%#V§ = new Vector3();
         super(param1);
      }
      
      public function init(param1:Object3D, param2:Vector3, param3:Number = 0) : void
      {
         this.turret = param1;
         this.§%#V§.copy(param2);
         this.§%#V§.y += param3;
      }
      
      public function §do package use§(param1:Object3D) : void
      {
      }
      
      public function §'!g§(param1:Object3D, param2:§3!0§, param3:int) : void
      {
         §with const false§.setMatrix(this.turret.x,this.turret.y,this.turret.z,this.turret.rotationX,this.turret.rotationY,this.turret.rotationZ);
         §with const false§.transformVector(this.§%#V§,§"M§);
         param1.x = §"M§.x;
         param1.y = §"M§.y;
         param1.z = §"M§.z;
      }
      
      public function destroy() : void
      {
         this.turret = null;
         recycle();
      }
   }
}

