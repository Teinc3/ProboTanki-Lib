package Renamed1
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.Renamed842;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   
   public class Renamed3265 extends Renamed1444 implements Renamed6901
   {
      private static const Renamed1273:Matrix4 = new Matrix4();
      
      private static const Renamed7027:Vector3 = new Vector3();
      
      private var turret:Object3D;
      
      private var Renamed5711:Vector3;
      
      public function Renamed3265(param1:Renamed1443)
      {
         this.Renamed5711 = new Vector3();
         super(param1);
      }
      
      public function init(param1:Object3D, param2:Vector3, param3:Number = 0) : void
      {
         this.turret = param1;
         this.Renamed5711.copy(param2);
         this.Renamed5711.y += param3;
      }
      
      public function Renamed6904(param1:Object3D) : void
      {
      }
      
      public function Renamed6905(param1:Object3D, param2:Renamed842, param3:int) : void
      {
         Renamed1273.setMatrix(this.turret.x,this.turret.y,this.turret.z,this.turret.rotationX,this.turret.rotationY,this.turret.rotationZ);
         Renamed1273.transformVector(this.Renamed5711,Renamed7027);
         param1.x = Renamed7027.x;
         param1.y = Renamed7027.y;
         param1.z = Renamed7027.z;
      }
      
      public function destroy() : void
      {
         this.turret = null;
         recycle();
      }
   }
}

