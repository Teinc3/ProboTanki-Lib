package §7"j§
{
   import §-!!§.§6!<§;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.§3!0§;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   
   public class §=&§ extends §["D§ implements §finally const package§
   {
      private static const §!#Y§:Vector3 = new Vector3();
      
      private static const §continue set static§:Vector3 = new Vector3();
      
      private static const §with const false§:Matrix4 = new Matrix4();
      
      private var §for package try§:§12§;
      
      private var §7#H§:int;
      
      private var turret:Object3D;
      
      private var §%#a§:Vector3;
      
      private var container:§6!<§;
      
      public function §=&§(param1:§1Q§)
      {
         this.§%#a§ = new Vector3();
         super(param1);
         this.§for package try§ = new §12§(1,1,0.5,0);
         this.§for package try§.§7"Z§(0,0,0,1,1,1,1,0);
         this.§for package try§.shadowMapAlphaThreshold = 2;
         this.§for package try§.depthMapAlphaThreshold = 2;
         this.§for package try§.useShadowMap = false;
         this.§for package try§.useLight = false;
      }
      
      public function init(param1:Vector3, param2:Object3D, param3:TextureMaterial, param4:int, param5:Number, param6:Number) : void
      {
         this.§%#a§.copy(param1);
         this.turret = param2;
         this.§7#H§ = param4;
         this.§for package try§.setMaterialToAllFaces(param3);
         this.§for package try§.width = param5;
         this.§for package try§.length = param6;
      }
      
      public function play(param1:int, param2:§3!0§) : Boolean
      {
         if(this.§7#H§ < 0)
         {
            return false;
         }
         this.§7#H§ -= param1;
         §with const false§.setMatrix(this.turret.x,this.turret.y,this.turret.z,this.turret.rotationX,this.turret.rotationY,this.turret.rotationZ);
         §with const false§.transformVector(this.§%#a§,§continue set static§);
         §with const false§.getAxis(1,§!#Y§);
         §null catch while§.§native var static§(this.§for package try§,§continue set static§,§!#Y§,param2.position);
         return true;
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.§for package try§);
         this.container = null;
         this.turret = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.§7#H§ = -1;
      }
      
      public function §&"-§(param1:§6!<§) : void
      {
         this.container = param1;
         param1.addChild(this.§for package try§);
      }
   }
}

