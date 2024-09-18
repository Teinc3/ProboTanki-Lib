package alternativa.physics.collision.colliders
{
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.physics.collision.primitives.CollisionBox;
   import alternativa.physics.collision.primitives.CollisionRect;
   import alternativa.physics.collision.primitives.CollisionTriangle;
   
   public class ColliderUtils
   {
      private static const _basisAxisX:Vector3 = new Vector3();
      
      private static const _basisAxisY:Vector3 = new Vector3();
      
      public function ColliderUtils()
      {
         super();
      }
      
      public static function buildContactBasis(param1:Vector3, param2:Matrix4, param3:Matrix4, param4:Matrix4) : void
      {
         var _loc5_:Vector3 = _basisAxisX;
         var _loc6_:Vector3 = _basisAxisY;
         if(Math.abs(param1.x) < Math.abs(param1.y))
         {
            _loc5_.x = 0;
            _loc5_.y = param1.z;
            _loc5_.z = -param1.y;
         }
         else
         {
            _loc5_.x = -param1.z;
            _loc5_.y = 0;
            _loc5_.z = param1.x;
         }
         _loc5_.normalize();
         _loc6_.x = param1.y * _loc5_.z - param1.z * _loc5_.y;
         _loc6_.y = param1.z * _loc5_.x - param1.x * _loc5_.z;
         _loc6_.z = param1.x * _loc5_.y - param1.y * _loc5_.x;
         param4.m00 = _loc5_.x;
         param4.m10 = _loc5_.y;
         param4.m20 = _loc5_.z;
         param4.m01 = _loc6_.x;
         param4.m11 = _loc6_.y;
         param4.m21 = _loc6_.z;
         param4.m02 = param1.x;
         param4.m12 = param1.y;
         param4.m22 = param1.z;
      }
      
      public static function transformFaceToReferenceSpace(param1:Matrix4, param2:Matrix4, param3:Vector.<Vertex>, param4:int) : void
      {
         var _loc5_:Vertex = null;
         var _loc6_:int = 0;
         while(_loc6_ < param4)
         {
            _loc5_ = param3[_loc6_];
            param2.transformVector(_loc5_.local,_loc5_.global);
            param1.transformVectorInverse(_loc5_.global,_loc5_.transformed);
            _loc6_++;
         }
      }
      
      public static function getBoxFaceVerticesInCCWOrder(param1:CollisionBox, param2:Vector3, param3:FaceSide, param4:Vector.<Vertex>) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Vector3 = null;
         var _loc14_:Vector3 = null;
         var _loc15_:Vertex = null;
         var _loc16_:Matrix4 = param1.transform;
         var _loc17_:int = 0;
         _loc9_ = _loc16_.m00;
         _loc10_ = _loc16_.m10;
         _loc11_ = _loc16_.m20;
         _loc5_ = _loc9_ * param2.x + _loc10_ * param2.y + _loc11_ * param2.z;
         _loc6_ = Math.abs(_loc5_);
         _loc9_ = _loc16_.m01;
         _loc10_ = _loc16_.m11;
         _loc11_ = _loc16_.m21;
         _loc8_ = _loc9_ * param2.x + _loc10_ * param2.y + _loc11_ * param2.z;
         _loc7_ = Math.abs(_loc8_);
         if(_loc7_ > _loc6_)
         {
            _loc6_ = _loc7_;
            _loc5_ = _loc8_;
            _loc17_ = 1;
         }
         _loc9_ = _loc16_.m02;
         _loc10_ = _loc16_.m12;
         _loc11_ = _loc16_.m22;
         _loc8_ = _loc9_ * param2.x + _loc10_ * param2.y + _loc11_ * param2.z;
         _loc7_ = Math.abs(_loc8_);
         if(_loc7_ > _loc6_)
         {
            _loc5_ = _loc8_;
            _loc17_ = 2;
         }
         _loc12_ = _loc5_ > 0 ? Number(1) : Number(-1);
         if(param3 == FaceSide.BACK)
         {
            _loc12_ = -_loc12_;
         }
         _loc14_ = param1.hs;
         switch(_loc17_)
         {
            case 0:
               (_loc13_ = Vertex(param4[0]).local).x = _loc12_ * _loc14_.x;
               _loc13_.y = _loc14_.y;
               _loc13_.z = _loc14_.z;
               (_loc13_ = Vertex(param4[1]).local).x = _loc12_ * _loc14_.x;
               _loc13_.y = -_loc14_.y;
               _loc13_.z = _loc14_.z;
               (_loc13_ = Vertex(param4[2]).local).x = _loc12_ * _loc14_.x;
               _loc13_.y = -_loc14_.y;
               _loc13_.z = -_loc14_.z;
               (_loc13_ = Vertex(param4[3]).local).x = _loc12_ * _loc14_.x;
               _loc13_.y = _loc14_.y;
               _loc13_.z = -_loc14_.z;
               break;
            case 1:
               (_loc13_ = Vertex(param4[0]).local).x = _loc14_.x;
               _loc13_.y = _loc12_ * _loc14_.y;
               _loc13_.z = _loc14_.z;
               (_loc13_ = Vertex(param4[1]).local).x = _loc14_.x;
               _loc13_.y = _loc12_ * _loc14_.y;
               _loc13_.z = -_loc14_.z;
               (_loc13_ = Vertex(param4[2]).local).x = -_loc14_.x;
               _loc13_.y = _loc12_ * _loc14_.y;
               _loc13_.z = -_loc14_.z;
               (_loc13_ = Vertex(param4[3]).local).x = -_loc14_.x;
               _loc13_.y = _loc12_ * _loc14_.y;
               _loc13_.z = _loc14_.z;
               break;
            case 2:
               (_loc13_ = Vertex(param4[0]).local).x = _loc14_.x;
               _loc13_.y = _loc14_.y;
               _loc13_.z = _loc12_ * _loc14_.z;
               (_loc13_ = Vertex(param4[1]).local).x = -_loc14_.x;
               _loc13_.y = _loc14_.y;
               _loc13_.z = _loc12_ * _loc14_.z;
               (_loc13_ = Vertex(param4[2]).local).x = -_loc14_.x;
               _loc13_.y = -_loc14_.y;
               _loc13_.z = _loc12_ * _loc14_.z;
               (_loc13_ = Vertex(param4[3]).local).x = _loc14_.x;
               _loc13_.y = -_loc14_.y;
               _loc13_.z = _loc12_ * _loc14_.z;
               break;
            default:
               throw new Error();
         }
         if(_loc5_ < 0)
         {
            _loc15_ = param4[0];
            param4[0] = param4[3];
            param4[3] = _loc15_;
            _loc15_ = param4[1];
            param4[1] = param4[2];
            param4[2] = _loc15_;
         }
      }
      
      public static function getRectFaceInCCWOrder(param1:CollisionRect, param2:Vector3, param3:Vector.<Vertex>) : void
      {
         var _loc4_:Vertex = null;
         var _loc5_:Vector3 = param1.hs;
         _loc4_ = param3[0];
         _loc4_.local.x = _loc5_.x;
         _loc4_.local.y = _loc5_.y;
         _loc4_.local.z = 0;
         _loc4_ = param3[1];
         _loc4_.local.x = -_loc5_.x;
         _loc4_.local.y = _loc5_.y;
         _loc4_.local.z = 0;
         _loc4_ = param3[2];
         _loc4_.local.x = -_loc5_.x;
         _loc4_.local.y = -_loc5_.y;
         _loc4_.local.z = 0;
         _loc4_ = param3[3];
         _loc4_.local.x = _loc5_.x;
         _loc4_.local.y = -_loc5_.y;
         _loc4_.local.z = 0;
         var _loc6_:Matrix4 = param1.transform;
         var _loc7_:Number = param2.x * _loc6_.m02 + param2.y * _loc6_.m12 + param2.z * _loc6_.m22;
         if(_loc7_ < 0)
         {
            _loc4_ = param3[0];
            param3[0] = param3[3];
            param3[3] = _loc4_;
            _loc4_ = param3[1];
            param3[1] = param3[2];
            param3[2] = _loc4_;
         }
      }
      
      public static function getTriangleFaceInCCWOrder(param1:CollisionTriangle, param2:Vector3, param3:Vector.<Vertex>) : void
      {
         var _loc4_:Vertex = null;
         _loc4_ = param3[0];
         _loc4_.local.x = param1.v0.x;
         _loc4_.local.y = param1.v0.y;
         _loc4_.local.z = 0;
         _loc4_ = param3[1];
         _loc4_.local.x = param1.v1.x;
         _loc4_.local.y = param1.v1.y;
         _loc4_.local.z = 0;
         _loc4_ = param3[2];
         _loc4_.local.x = param1.v2.x;
         _loc4_.local.y = param1.v2.y;
         _loc4_.local.z = 0;
         var _loc5_:Matrix4 = param1.transform;
         var _loc6_:Number = param2.x * _loc5_.m02 + param2.y * _loc5_.m12 + param2.z * _loc5_.m22;
         if(_loc6_ < 0)
         {
            _loc4_ = param3[0];
            param3[0] = param3[2];
            param3[2] = _loc4_;
         }
      }
   }
}

