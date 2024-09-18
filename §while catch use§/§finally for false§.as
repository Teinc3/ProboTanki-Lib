package §while catch use§
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.Shadow;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.§+$%§;
   import alternativa.tanks.battle.objects.tank.tankskin.§"#g§;
   import alternativa.tanks.battle.objects.tank.tankskin.§for for if§;
   import alternativa.tanks.battle.scene3d.§[!r§;
   
   public class §finally for false§
   {
      public static const §with const false§:Matrix4 = new Matrix4();
      
      protected var turret:Mesh;
      
      private var §;#A§:§"#g§;
      
      public function §finally for false§(param1:Mesh)
      {
         super();
         this.turret = param1;
         this.§;#A§ = new §"#g§(param1);
      }
      
      public function §for const static§(param1:Shadow) : void
      {
         param1.addCaster(this.turret);
      }
      
      public function set alpha(param1:Number) : void
      {
         this.turret.alpha = param1;
      }
      
      public function destroy() : void
      {
         this.§;#A§.destroy();
      }
      
      public function §7Y§(param1:TextureMaterial, param2:TextureMaterial) : void
      {
         this.turret.setMaterialToAllFaces(param1);
         this.§;#A§.§28§(param2);
      }
      
      public function addToScene(param1:§[!r§) : void
      {
         param1.§with catch with§(this.turret);
      }
      
      public function removeFromScene(param1:§[!r§) : void
      {
         param1.removeObject(this.turret);
      }
      
      public function §3!V§(param1:Matrix4, param2:§for for if§, param3:Number) : void
      {
         var _loc4_:Vector3 = null;
         §with const false§.setMatrix(param2.§static for set§(),param2.§-1§(),param2.§&T§() + 1,0,0,param3);
         §with const false§.append(param1);
         this.turret.x = §with const false§.m03;
         this.turret.y = §with const false§.m13;
         this.turret.z = §with const false§.m23;
         _loc4_ = §+$%§.§@!c§;
         §with const false§.getEulerAngles(_loc4_);
         this.turret.rotationX = _loc4_.x;
         this.turret.rotationY = _loc4_.y;
         this.turret.rotationZ = _loc4_.z;
      }
      
      public function §do catch else§() : §"#g§
      {
         return this.§;#A§;
      }
      
      public function §2"F§() : Object3D
      {
         return this.turret;
      }
      
      public function §include while§() : Object3D
      {
         return this.turret;
      }
   }
}

