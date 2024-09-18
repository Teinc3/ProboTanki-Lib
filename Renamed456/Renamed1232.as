package Renamed456
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.Shadow;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.objects.tank.tankskin.Renamed1185;
   import alternativa.tanks.battle.objects.tank.tankskin.Renamed918;
   import alternativa.tanks.battle.scene3d.Renamed610;
   
   public class Renamed1232
   {
      public static const Renamed1273:Matrix4 = new Matrix4();
      
      protected var turret:Mesh;
      
      private var Renamed9107:Renamed1185;
      
      public function Renamed1232(param1:Mesh)
      {
         super();
         this.turret = param1;
         this.Renamed9107 = new Renamed1185(param1);
      }
      
      public function Renamed1257(param1:Shadow) : void
      {
         param1.addCaster(this.turret);
      }
      
      public function set alpha(param1:Number) : void
      {
         this.turret.alpha = param1;
      }
      
      public function destroy() : void
      {
         this.Renamed9107.destroy();
      }
      
      public function Renamed1265(param1:TextureMaterial, param2:TextureMaterial) : void
      {
         this.turret.setMaterialToAllFaces(param1);
         this.Renamed9107.Renamed1179(param2);
      }
      
      public function addToScene(param1:Renamed610) : void
      {
         param1.Renamed1258(this.turret);
      }
      
      public function removeFromScene(param1:Renamed610) : void
      {
         param1.removeObject(this.turret);
      }
      
      public function Renamed1063(param1:Matrix4, param2:Renamed918, param3:Number) : void
      {
         var _loc4_:Vector3 = null;
         Renamed1273.setMatrix(param2.Renamed1097(),param2.Renamed1098(),param2.Renamed1099() + 1,0,0,param3);
         Renamed1273.append(param1);
         this.turret.x = Renamed1273.m03;
         this.turret.y = Renamed1273.m13;
         this.turret.z = Renamed1273.m23;
         _loc4_ = Renamed668.Renamed669;
         Renamed1273.getEulerAngles(_loc4_);
         this.turret.rotationX = _loc4_.x;
         this.turret.rotationY = _loc4_.y;
         this.turret.rotationZ = _loc4_.z;
      }
      
      public function Renamed1270() : Renamed1185
      {
         return this.Renamed9107;
      }
      
      public function Renamed1020() : Object3D
      {
         return this.turret;
      }
      
      public function Renamed1056() : Object3D
      {
         return this.turret;
      }
   }
}

