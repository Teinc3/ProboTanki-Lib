package Renamed1
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.Renamed842;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   
   public class Renamed836 extends Renamed1444 implements Renamed6901
   {
      private var Renamed6928:Vector3;
      
      private var velocity:Vector3;
      
      private var Renamed6929:Number;
      
      public function Renamed836(param1:Renamed1443)
      {
         this.Renamed6928 = new Vector3();
         this.velocity = new Vector3();
         super(param1);
      }
      
      public function Renamed6904(param1:Object3D) : void
      {
         param1.x = this.Renamed6928.x;
         param1.y = this.Renamed6928.y;
         param1.z = this.Renamed6928.z;
         param1.scaleX = 1;
         param1.scaleY = 1;
         param1.scaleZ = 1;
      }
      
      public function init(param1:Vector3, param2:Vector3, param3:Number) : void
      {
         this.Renamed6928.copy(param1);
         this.velocity.copy(param2);
         this.Renamed6929 = param3;
      }
      
      public function Renamed6905(param1:Object3D, param2:Renamed842, param3:int) : void
      {
         var _loc4_:Number = 0.001 * param3;
         param1.x += this.velocity.x * _loc4_;
         param1.y += this.velocity.y * _loc4_;
         param1.z += this.velocity.z * _loc4_;
         param1.scaleX += this.Renamed6929;
         param1.scaleY += this.Renamed6929;
         param1.scaleZ += this.Renamed6929;
      }
      
      public function destroy() : void
      {
         recycle();
      }
   }
}

