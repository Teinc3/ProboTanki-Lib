package Renamed1
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   
   public class Renamed6378
   {
      private static var axis1:Vector3 = new Vector3();
      
      private static var Renamed7049:Vector3 = new Vector3();
      
      private static var eulerAngles:Vector3 = new Vector3();
      
      private static var Renamed7050:Vector3 = new Vector3();
      
      private static var Renamed7051:Vector3 = new Vector3();
      
      private static var Renamed7052:Matrix3 = new Matrix3();
      
      private static var Renamed7053:Matrix3 = new Matrix3();
      
      public function Renamed6378()
      {
         super();
      }
      
      public static function Renamed6415(param1:Object3D, param2:Vector3, param3:Vector3, param4:Vector3) : void
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
         Renamed7052.fromAxisAngle(axis1,_loc5_);
         Renamed7050.x = param4.x - param2.x;
         Renamed7050.y = param4.y - param2.y;
         Renamed7050.z = param4.z - param2.z;
         var _loc6_:Number = Renamed7050.x * param3.x + Renamed7050.y * param3.y + Renamed7050.z * param3.z;
         Renamed7050.x -= _loc6_ * param3.x;
         Renamed7050.y -= _loc6_ * param3.y;
         Renamed7050.z -= _loc6_ * param3.z;
         Renamed7050.normalize();
         Renamed7052.transformVector(Vector3.Z_AXIS,Renamed7051);
         _loc6_ = Renamed7051.x * Renamed7050.x + Renamed7051.y * Renamed7050.y + Renamed7051.z * Renamed7050.z;
         Renamed7049.x = Renamed7051.y * Renamed7050.z - Renamed7051.z * Renamed7050.y;
         Renamed7049.y = Renamed7051.z * Renamed7050.x - Renamed7051.x * Renamed7050.z;
         Renamed7049.z = Renamed7051.x * Renamed7050.y - Renamed7051.y * Renamed7050.x;
         Renamed7049.normalize();
         _loc5_ = Math.acos(_loc6_);
         Renamed7053.fromAxisAngle(Renamed7049,_loc5_);
         Renamed7052.append(Renamed7053);
         Renamed7052.getEulerAngles(eulerAngles);
         param1.rotationX = eulerAngles.x;
         param1.rotationY = eulerAngles.y;
         param1.rotationZ = eulerAngles.z;
         param1.x = param2.x;
         param1.y = param2.y;
         param1.z = param2.z;
      }
      
      public static function Renamed6413(param1:Object3D, param2:Vector3, param3:Vector3, param4:Boolean, param5:Number, param6:Number) : void
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
      
      public static function Renamed7054(param1:Object3D) : void
      {
         param1.softAttenuation = 80;
         param1.useLight = false;
         param1.shadowMapAlphaThreshold = 2;
         param1.depthMapAlphaThreshold = 2;
         param1.useShadowMap = false;
      }
   }
}

