package Renamed1
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.Renamed842;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   
   public class Renamed7061 extends Renamed1444 implements Renamed6901
   {
      private var Renamed6928:Vector3;
      
      private var velocity:Vector3;
      
      private var acceleration:Number;
      
      public function Renamed7061(param1:Renamed1443)
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
      }
      
      public function init(param1:Vector3, param2:Vector3, param3:Number) : void
      {
         this.Renamed6928.copy(param1);
         this.velocity.copy(param2);
         this.acceleration = param3;
      }
      
      public function Renamed6905(param1:Object3D, param2:Renamed842, param3:int) : void
      {
         var _loc4_:Number = NaN;
         _loc4_ = 0.001 * param3;
         param1.x += this.velocity.x * _loc4_;
         param1.y += this.velocity.y * _loc4_;
         param1.z += this.velocity.z * _loc4_;
         var _loc5_:Number = this.velocity.length();
         if((_loc5_ = _loc5_ + this.acceleration * _loc4_) <= 0)
         {
            this.velocity.reset();
         }
         else
         {
            this.velocity.normalize();
            this.velocity.scale(_loc5_);
         }
      }
      
      public function destroy() : void
      {
         recycle();
      }
   }
}

