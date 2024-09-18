package alternativa.tanks.models.weapon
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   
   public class §catch catch§
   {
      private static const §with const false§:Matrix4 = new Matrix4();
      
      private static const §2#A§:Vector3 = new Vector3();
      
      public function §catch catch§()
      {
         super();
      }
      
      public static function §^S§(param1:Object3D, param2:Vector3, param3:§ !8§) : void
      {
         §with const false§.setFromMatrix3D(param1.concatenatedMatrix);
         §with const false§.transformVector(param2,param3.§6u§);
         §2#A§.x = param2.x;
         §2#A§.z = param2.z;
         §with const false§.transformVector(§2#A§,param3.§if package var§);
         param3.§false var try§.x = §with const false§.m00;
         param3.§false var try§.y = §with const false§.m10;
         param3.§false var try§.z = §with const false§.m20;
         param3.direction.x = §with const false§.m01;
         param3.direction.y = §with const false§.m11;
         param3.direction.z = §with const false§.m21;
      }
      
      public static function §for const throw§(param1:Object3D, param2:Vector3, param3:§final set var§) : void
      {
         §with const false§.setMatrix(param1.x,param1.y,param1.z,param1.rotationX,param1.rotationY,param1.rotationZ);
         §with const false§.transformVector(param2,param3.§6u§);
         param3.direction.x = §with const false§.m01;
         param3.direction.y = §with const false§.m11;
         param3.direction.z = §with const false§.m21;
      }
   }
}

