package alternativa.tanks.models.weapon
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   
   public class Renamed921
   {
      private static const Renamed1273:Matrix4 = new Matrix4();
      
      private static const Renamed3034:Vector3 = new Vector3();
      
      public function Renamed921()
      {
         super();
      }
      
      public static function Renamed1055(param1:Object3D, param2:Vector3, param3:Renamed664) : void
      {
         Renamed1273.setFromMatrix3D(param1.concatenatedMatrix);
         Renamed1273.transformVector(param2,param3.Renamed693);
         Renamed3034.x = param2.x;
         Renamed3034.z = param2.z;
         Renamed1273.transformVector(Renamed3034,param3.Renamed689);
         param3.Renamed3025.x = Renamed1273.m00;
         param3.Renamed3025.y = Renamed1273.m10;
         param3.Renamed3025.z = Renamed1273.m20;
         param3.direction.x = Renamed1273.m01;
         param3.direction.y = Renamed1273.m11;
         param3.direction.z = Renamed1273.m21;
      }
      
      public static function Renamed1060(param1:Object3D, param2:Vector3, param3:Renamed922) : void
      {
         Renamed1273.setMatrix(param1.x,param1.y,param1.z,param1.rotationX,param1.rotationY,param1.rotationZ);
         Renamed1273.transformVector(param2,param3.Renamed693);
         param3.direction.x = Renamed1273.m01;
         param3.direction.y = Renamed1273.m11;
         param3.direction.z = Renamed1273.m21;
      }
   }
}

