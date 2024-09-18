package §7"j§
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.§3!0§;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   
   public class §;"L§ extends §["D§ implements §super const class§
   {
      private var normal:Vector3;
      
      private var position:Vector3;
      
      private var distance:Number;
      
      private var §#O§:Vector3;
      
      public function §;"L§(param1:§1Q§)
      {
         this.normal = new Vector3();
         this.position = new Vector3();
         this.§#O§ = new Vector3();
         super(param1);
      }
      
      public function init(param1:Vector3, param2:Vector3, param3:Number) : void
      {
         this.position.copy(param1);
         this.normal.copy(param2);
         this.distance = param3;
         this.normal.normalize();
         this.compute();
      }
      
      private function compute() : void
      {
         this.§#O§.copy(this.normal);
         this.§#O§.scale(this.distance);
         this.§#O§.add(this.position);
      }
      
      public function §do package use§(param1:Object3D) : void
      {
         param1.x = this.§#O§.x;
         param1.y = this.§#O§.y;
         param1.z = this.§#O§.z;
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

