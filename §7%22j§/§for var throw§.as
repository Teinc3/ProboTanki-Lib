package §7"j§
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.§3!0§;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   
   public class §for var throw§ extends §["D§ implements §super const class§
   {
      private var position:Vector3;
      
      public function §for var throw§(param1:§1Q§)
      {
         this.position = new Vector3();
         super(param1);
      }
      
      public function setPosition(param1:Vector3) : void
      {
         this.position.copy(param1);
      }
      
      public function §do package use§(param1:Object3D) : void
      {
         param1.x = this.position.x;
         param1.y = this.position.y;
         param1.z = this.position.z;
      }
      
      public function §'!g§(param1:Object3D, param2:§3!0§, param3:int) : void
      {
         this.§do package use§(param1);
      }
      
      public function destroy() : void
      {
         recycle();
      }
   }
}

