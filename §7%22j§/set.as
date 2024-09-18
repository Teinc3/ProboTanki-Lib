package §7"j§
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.§3!0§;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   
   public class set extends §["D§ implements §super const class§
   {
      private static const §do set continue§:Vector3 = new Vector3();
      
      private var position:Vector3;
      
      private var §[#8§:Number;
      
      public function set(param1:§1Q§)
      {
         this.position = new Vector3();
         super(param1);
      }
      
      public function init(param1:Vector3, param2:Number) : void
      {
         this.position.copy(param1);
         this.§[#8§ = param2;
      }
      
      public function §do package use§(param1:Object3D) : void
      {
         param1.x = this.position.x;
         param1.y = this.position.y;
         param1.z = this.position.z;
      }
      
      public function §'!g§(param1:Object3D, param2:§3!0§, param3:int) : void
      {
         §do set continue§.x = param2.x - this.position.x;
         §do set continue§.y = param2.y - this.position.y;
         §do set continue§.z = param2.z - this.position.z;
         §do set continue§.normalize();
         param1.x = this.position.x + this.§[#8§ * §do set continue§.x;
         param1.y = this.position.y + this.§[#8§ * §do set continue§.y;
         param1.z = this.position.z + this.§[#8§ * §do set continue§.z;
      }
      
      public function destroy() : void
      {
         recycle();
      }
   }
}

