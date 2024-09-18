package Renamed1
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.physics.collision.CollisionDetector;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.camera.Renamed842;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   import Renamed373.Renamed666;
   
   public class Renamed6939 extends Renamed1444 implements Renamed6901
   {
      private static const Renamed1273:Matrix4 = new Matrix4();
      
      private static const Renamed689:Vector3 = new Vector3();
      
      private static const direction:Vector3 = new Vector3();
      
      private static const Renamed6987:Vector3 = new Vector3();
      
      private static const Renamed6988:Vector3 = new Vector3();
      
      private static const intersection:RayHit = new RayHit();
      
      private static const Renamed1519:Number = 20;
      
      private static const Renamed6989:Number = 0.2;
      
      private var Renamed6525:Number;
      
      private var collisionDetector:CollisionDetector;
      
      private var Renamed6990:Vector3;
      
      private var turret:Object3D;
      
      private var coeff:Number;
      
      private var Renamed6991:Number = 0;
      
      public function Renamed6939(param1:Renamed1443)
      {
         this.Renamed6990 = new Vector3();
         super(param1);
      }
      
      private function Renamed6992() : void
      {
         Renamed1273.setMatrix(this.turret.x,this.turret.y,this.turret.z,this.turret.rotationX,this.turret.rotationY,this.turret.rotationZ);
         Renamed6987.x = Renamed1273.m00;
         Renamed6987.y = Renamed1273.m10;
         Renamed6987.z = Renamed1273.m20;
         direction.x = Renamed1273.m01;
         direction.y = Renamed1273.m11;
         direction.z = Renamed1273.m21;
         Renamed1273.transformVector(this.Renamed6990,Renamed6988);
         var _loc1_:Number = this.Renamed6990.y;
         Renamed689.x = Renamed6988.x - _loc1_ * direction.x;
         Renamed689.y = Renamed6988.y - _loc1_ * direction.y;
         Renamed689.z = Renamed6988.z - _loc1_ * direction.z;
      }
      
      public function init(param1:Object3D, param2:Vector3, param3:CollisionDetector, param4:Number, param5:Number = 0.5) : void
      {
         this.turret = param1;
         this.Renamed6990 = param2;
         this.collisionDetector = param3;
         this.Renamed6525 = param4;
         this.coeff = param5;
         this.Renamed6991 = 0;
      }
      
      public function Renamed6904(param1:Object3D) : void
      {
         this.Renamed6992();
         var _loc2_:Number = this.Renamed6525 * this.coeff;
         if(this.collisionDetector.raycastStatic(Renamed689,direction,Renamed666.Renamed690,this.Renamed6525,null,intersection))
         {
            _loc2_ = Vector3.distanceBetween(Renamed689,intersection.position) * this.coeff;
         }
         var _loc3_:Number = _loc2_ - this.Renamed6991;
         if(Math.abs(_loc3_) <= Renamed1519)
         {
            this.Renamed6991 = _loc2_;
         }
         else
         {
            this.Renamed6991 += _loc3_ * Renamed6989;
         }
         param1.x = Renamed689.x + direction.x * this.Renamed6991;
         param1.y = Renamed689.y + direction.y * this.Renamed6991;
         param1.z = Renamed689.z + direction.z * this.Renamed6991;
      }
      
      public function Renamed6905(param1:Object3D, param2:Renamed842, param3:int) : void
      {
         this.Renamed6904(param1);
      }
      
      public function destroy() : void
      {
         this.turret = null;
         this.collisionDetector = null;
         recycle();
      }
   }
}

