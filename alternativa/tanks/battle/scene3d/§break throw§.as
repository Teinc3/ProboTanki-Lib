package alternativa.tanks.battle.scene3d
{
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.ShadowMap;
   import alternativa.engine3d.lights.DirectionalLight;
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.§break var override§;
   import flash.geom.Vector3D;
   
   public class §break throw§
   {
      private static const §each for set§:int = 2048;
      
      private static const §`!k§:Number = 0.5;
      
      private static const §>! §:Number = 10000;
      
      private static const §@"?§:Number = 5000;
      
      private static const §&#6§:Number = 10000;
      
      private var lightColor:§break var override§;
      
      private var shadowColor:§break var override§;
      
      private var angleX:Number = 0;
      
      private var angleZ:Number = 0;
      
      private var direction:Vector3D;
      
      private var camera:Camera3D;
      
      public function §break throw§(param1:Camera3D)
      {
         this.direction = new Vector3D(1,1,1);
         super();
         this.camera = param1;
      }
      
      public function §-I§() : void
      {
         this.camera.shadowMap = new ShadowMap(§each for set§,§@"?§,§&#6§,§`!k§,§>! §);
      }
      
      public function §[",§() : void
      {
         if(this.camera.shadowMap != null)
         {
            this.camera.shadowMap.dispose();
            this.camera.shadowMap = null;
         }
      }
      
      public function §true set catch§() : void
      {
         this.camera.directionalLight = new DirectionalLight(this.lightColor.§#!@§());
         this.camera.directionalLight.lookAt(this.direction.x,this.direction.y,this.direction.z);
         this.camera.ambientColor = this.shadowColor.§#!@§();
      }
      
      public function § #m§() : void
      {
         this.camera.directionalLight = null;
      }
      
      public function setup(param1:int, param2:int, param3:Number, param4:Number) : void
      {
         this.lightColor = new §break var override§(param1);
         this.shadowColor = new §break var override§(param2);
         this.lightColor.subtract(this.shadowColor);
         this.angleX = param3;
         this.angleZ = param4;
         this.§native catch super§();
      }
      
      private function §native catch super§() : void
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
            this.§-I§();
         }
         else
         {
            this.§[",§();
         }
      }
   }
}

