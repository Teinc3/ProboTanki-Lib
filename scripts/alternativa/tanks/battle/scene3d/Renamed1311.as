package alternativa.tanks.battle.scene3d
{
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.ShadowMap;
   import alternativa.engine3d.lights.DirectionalLight;
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.Renamed770;
   import flash.geom.Vector3D;
   
   public class Renamed1311
   {
      private static const Renamed1312:int = 2048;
      
      private static const Renamed1313:Number = 0.5;
      
      private static const Renamed1314:Number = 10000;
      
      private static const Renamed1315:Number = 5000;
      
      private static const Renamed1316:Number = 10000;
      
      private var lightColor:Renamed770;
      
      private var shadowColor:Renamed770;
      
      private var angleX:Number = 0;
      
      private var angleZ:Number = 0;
      
      private var direction:Vector3D;
      
      private var camera:Camera3D;
      
      public function Renamed1311(param1:Camera3D)
      {
         this.direction = new Vector3D(1,1,1);
         super();
         this.camera = param1;
      }
      
      public function Renamed1317() : void
      {
         this.camera.shadowMap = new ShadowMap(Renamed1312,Renamed1315,Renamed1316,Renamed1313,Renamed1314);
      }
      
      public function Renamed1318() : void
      {
         if(this.camera.shadowMap != null)
         {
            this.camera.shadowMap.dispose();
            this.camera.shadowMap = null;
         }
      }
      
      public function Renamed1319() : void
      {
         this.camera.directionalLight = new DirectionalLight(this.lightColor.Renamed772());
         this.camera.directionalLight.lookAt(this.direction.x,this.direction.y,this.direction.z);
         this.camera.ambientColor = this.shadowColor.Renamed772();
      }
      
      public function Renamed1320() : void
      {
         this.camera.directionalLight = null;
      }
      
      public function setup(param1:int, param2:int, param3:Number, param4:Number) : void
      {
         this.lightColor = new Renamed770(param1);
         this.shadowColor = new Renamed770(param2);
         this.lightColor.subtract(this.shadowColor);
         this.angleX = param3;
         this.angleZ = param4;
         this.Renamed1321();
      }
      
      private function Renamed1321() : void
      {
         var _loc1_:Matrix3 = new Matrix3();
         _loc1_.setRotationMatrix(this.angleX,0,this.angleZ);
         var _loc2_:Vector3 = new Vector3(0,1,0);
         _loc2_.transform3(_loc1_);
         this.direction.x = _loc2_.x;
         this.direction.y = _loc2_.y;
         this.direction.z = _loc2_.z;
      }
      
      public function toggle() : void
      {
         if(this.camera.shadowMap == null)
         {
            this.Renamed1317();
         }
         else
         {
            this.Renamed1318();
         }
      }
   }
}

