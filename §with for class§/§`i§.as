package §with for class§
{
   import §7"j§.§null catch while§;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.math.Vector3;
   import §extends for const§.§1Q§;
   
   public class §`i§ extends §`6§
   {
      private var §continue final§:Sprite3D;
      
      private var _direction:Vector3;
      
      private var § !=§:Number = 0;
      
      public function §`i§(param1:§1Q§)
      {
         this.§continue final§ = new Sprite3D(1,1);
         this._direction = new Vector3();
         super(param1);
         §null catch while§.§each set while§(this.§continue final§);
      }
      
      public function init(param1:Number, param2:Vector3, param3:Vector3, param4:TextureMaterial) : void
      {
         this.§ !=§ = 0;
         this._direction.copy(param3);
         this.§continue final§.width = param1;
         this.§continue final§.height = param1;
         this.§continue final§.x = param2.x;
         this.§continue final§.y = param2.y;
         this.§continue final§.z = param2.z;
         this.§continue final§.material = param4;
      }
      
      public function get sprite() : Sprite3D
      {
         return this.§continue final§;
      }
      
      public function get direction() : Vector3
      {
         return this._direction;
      }
      
      public function get time() : Number
      {
         return this.§ !=§;
      }
      
      public function set time(param1:Number) : void
      {
         this.§ !=§ = param1;
      }
   }
}

