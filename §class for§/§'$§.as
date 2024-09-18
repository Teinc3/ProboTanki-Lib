package §class for§
{
   import §-!!§.§6!<§;
   import §7"j§.§do set while§;
   import §7"j§.§finally const package§;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.§3!0§;
   import alternativa.tanks.engine3d.§throw const switch§;
   import alternativa.tanks.engine3d.§try set break§;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   
   public class §'$§ extends §["D§ implements §finally const package§
   {
      private static const §"M§:Vector3 = new Vector3();
      
      private static const matrix:Matrix4 = new Matrix4();
      
      protected var sprite:Sprite3D;
      
      private var §const super§:Number;
      
      private var §2!2§:Number;
      
      private var §catch catch catch§:Vector.<§try set break§>;
      
      private var numFrames:int;
      
      private var §%#a§:Vector3;
      
      private var turret:Object3D;
      
      private var listener:§do set while§;
      
      private var container:§6!<§;
      
      public function §'$§(param1:§1Q§)
      {
         this.§%#a§ = new Vector3();
         super(param1);
         this.sprite = new Sprite3D(1,1);
         this.sprite.useShadowMap = false;
         this.sprite.useLight = false;
      }
      
      public function init(param1:Number, param2:Number, param3:§throw const switch§, param4:Vector3, param5:Object3D, param6:Number, param7:Number, param8:§do set while§) : void
      {
         this.§static var native§(param1,param2,param6,param3.material);
         this.§catch catch catch§ = param3.§catch catch catch§;
         this.§const super§ = 0.001 * param7;
         this.§%#a§.copy(param4);
         this.§%#a§.y += 10;
         this.turret = param5;
         this.listener = param8;
         this.numFrames = this.§catch catch catch§.length;
         this.§2!2§ = 0;
      }
      
      public function §&"-§(param1:§6!<§) : void
      {
         this.container = param1;
         param1.addChild(this.sprite);
      }
      
      public function play(param1:int, param2:§3!0§) : Boolean
      {
         if(this.§2!2§ >= this.numFrames)
         {
            return false;
         }
         matrix.setMatrix(this.turret.x,this.turret.y,this.turret.z,this.turret.rotationX,this.turret.rotationY,this.turret.rotationZ);
         matrix.transformVector(this.§%#a§,§"M§);
         this.sprite.x = §"M§.x;
         this.sprite.y = §"M§.y;
         this.sprite.z = §"M§.z;
         this.§;!4§(this.§catch catch catch§[int(this.§2!2§)]);
         this.§2!2§ += this.§const super§ * param1;
         return true;
      }
      
      private function §;!4§(param1:§try set break§) : void
      {
         this.sprite.topLeftU = param1.topLeftU;
         this.sprite.topLeftV = param1.topLeftV;
         this.sprite.bottomRightU = param1.bottomRightU;
         this.sprite.bottomRightV = param1.bottomRightV;
      }
      
      public function destroy() : void
      {
         this.listener.§return finally§(this);
         this.listener = null;
         this.container.removeChild(this.sprite);
         this.sprite.material = null;
         this.§catch catch catch§ = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.§2!2§ = this.numFrames + 1;
      }
      
      private function §static var native§(param1:Number, param2:Number, param3:Number, param4:TextureMaterial) : void
      {
         this.sprite.width = param1;
         this.sprite.height = param2;
         this.sprite.rotation = param3;
         this.sprite.material = param4;
      }
   }
}

