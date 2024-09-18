package §7"j§
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   
   public class §null catch while§
   {
      private static var axis1:Vector3 = new Vector3();
      
      private static var §#&§:Vector3 = new Vector3();
      
      private static var eulerAngles:Vector3 = new Vector3();
      
      private static var §@$#§:Vector3 = new Vector3();
      
      private static var §=#U§:Vector3 = new Vector3();
      
      private static var §;!P§:Matrix3 = new Matrix3();
      
      private static var §null for false§:Matrix3 = new Matrix3();
      
      public function §null catch while§()
      {
         super();
      }
      
      public static function §native var static§(param1:Object3D, param2:Vector3, param3:Vector3, param4:Vector3) : void
      {
         var _loc5_:Number = NaN;
         if(param3.y < -0.99999 || param3.y > 0.99999)
         {
            axis1.x = 0;
            axis1.y = 0;
            axis1.z = 1;
            _loc5_ = param3.y < 0 ? Math.PI : 0;
         }
         else
         {
            axis1.x = param3.z;
            axis1.y = 0;
            axis1.z = -param3.x;
            axis1.normalize();
            _loc5_ = Math.acos(param3.y);
         }
         §;!P§.fromAxisAngle(axis1,_loc5_);
         §@$#§.x = param4.x - param2.x;
         §@$#§.y = param4.y - param2.y;
         §@$#§.z = param4.z - param2.z;
         var _loc6_:Number = §@$#§.x * param3.x + §@$#§.y * param3.y + §@$#§.z * param3.z;
         §@$#§.x -= _loc6_ * param3.x;
         §@$#§.y -= _loc6_ * param3.y;
         §@$#§.z -= _loc6_ * param3.z;
         §@$#§.normalize();
         §;!P§.transformVector(Vector3.Z_AXIS,§=#U§);
         _loc6_ = §=#U§.x * §@$#§.x + §=#U§.y * §@$#§.y + §=#U§.z * §@$#§.z;
         §#&§.x = §=#U§.y * §@$#§.z - §=#U§.z * §@$#§.y;
         §#&§.y = §=#U§.z * §@$#§.x - §=#U§.x * §@$#§.z;
         §#&§.z = §=#U§.x * §@$#§.y - §=#U§.y * §@$#§.x;
         §#&§.normalize();
         _loc5_ = Math.acos(_loc6_);
         §null for false§.fromAxisAngle(§#&§,_loc5_);
         §;!P§.append(§null for false§);
         §;!P§.getEulerAngles(eulerAngles);
         param1.rotationX = eulerAngles.x;
         param1.rotationY = eulerAngles.y;
         param1.rotationZ = eulerAngles.z;
         param1.x = param2.x;
         param1.y = param2.y;
         param1.z = param2.z;
      }
      
      public static function §4!R§(param1:Object3D, param2:Vector3, param3:Vector3, param4:Boolean, param5:Number, param6:Number) : void
      {
         var _loc7_:Number = param2.x - param1.x;
         var _loc8_:Number = param2.y - param1.y;
         var _loc9_:Number = param2.z - param1.z;
         var _loc10_:Number = Math.sqrt(_loc7_ * _loc7_ + _loc8_ * _loc8_ + _loc9_ * _loc9_);
         _loc7_ /= _loc10_;
         _loc8_ /= _loc10_;
         _loc9_ /= _loc10_;
         var _loc11_:Number = Math.abs(_loc7_ * param3.x + _loc8_ * param3.y + _loc9_ * param3.z);
         if(param4)
         {
            _loc11_ = 1 - _loc11_;
         }
         _loc11_ = Math.pow(_loc11_,param5);
         param1.alpha = 1 - _loc11_ / param6;
         if(param1.alpha < 0)
         {
            param1.alpha = 0;
         }
      }
      
      public static function §each set while§(param1:Object3D) : void
      {
         param1.softAttenuation = 80;
         param1.useLight = false;
         param1.shadowMapAlphaThreshold = 2;
         param1.depthMapAlphaThreshold = 2;
         param1.useShadowMap = false;
      }
   }
}

