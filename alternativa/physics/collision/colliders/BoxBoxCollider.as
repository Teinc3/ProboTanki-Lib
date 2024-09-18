package alternativa.physics.collision.colliders
{
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.physics.ShapeContact;
   import alternativa.physics.collision.Collider;
   import alternativa.physics.collision.CollisionShape;
   import alternativa.physics.collision.primitives.CollisionBox;
   
   public class BoxBoxCollider implements Collider
   {
      private static const _axis:Vector3 = new Vector3();
      
      private static const _axis10:Vector3 = new Vector3();
      
      private static const _axis11:Vector3 = new Vector3();
      
      private static const _axis12:Vector3 = new Vector3();
      
      private static const _axis20:Vector3 = new Vector3();
      
      private static const _axis21:Vector3 = new Vector3();
      
      private static const _axis22:Vector3 = new Vector3();
      
      private static const _vectorToBox:Vector3 = new Vector3();
      
      private static const faceVertices1:Vector.<Vertex> = Vector.<Vertex>([new Vertex(),new Vertex(),new Vertex(),new Vertex()]);
      
      private static const faceVertices2:Vector.<Vertex> = Vector.<Vertex>([new Vertex(),new Vertex(),new Vertex(),new Vertex()]);
      
      private static const _basisMatrix:Matrix4 = new Matrix4();
      
      private var epsilon:Number;
      
      private var minOverlap:Number;
      
      public function BoxBoxCollider(param1:Number)
      {
         this.minOverlapAxis = new Vector3();
         super();
         this.epsilon = param1;
      }
      
      public function getContacts(param1:CollisionShape, param2:CollisionShape, param3:Vector.<ShapeContact>) : void
      {
         var _loc4_:CollisionBox = null;
         var _loc5_:CollisionBox = null;
         if(this.haveCollision(param1,param2))
         {
            _loc4_ = CollisionBox(param1);
            _loc5_ = CollisionBox(param2);
            this.findContacts(_loc4_,_loc5_,this.minOverlapAxis,param3);
         }
      }
      
      public function haveCollision(param1:CollisionShape, param2:CollisionShape, param3:Boolean = false) : Boolean
      {
         var _loc4_:CollisionBox = null;
         var _loc5_:Matrix4 = null;
         var _loc6_:Vector3 = null;
         this.minOverlap = 10000000000;
         _loc4_ = CollisionBox(param1);
         var _loc7_:CollisionBox = CollisionBox(param2);
         _loc5_ = _loc4_.transform;
         var _loc8_:Matrix4 = _loc7_.transform;
         (_loc6_ = _vectorToBox).x = _loc5_.m03 - _loc8_.m03;
         _loc6_.y = _loc5_.m13 - _loc8_.m13;
         _loc6_.z = _loc5_.m23 - _loc8_.m23;
         _axis10.x = _loc5_.m00;
         _axis10.y = _loc5_.m10;
         _axis10.z = _loc5_.m20;
         if(!this.testOverlapOnMainAxis(_loc4_,_loc7_,_axis10,_loc6_,param3))
         {
            return false;
         }
         _axis11.x = _loc5_.m01;
         _axis11.y = _loc5_.m11;
         _axis11.z = _loc5_.m21;
         if(!this.testOverlapOnMainAxis(_loc4_,_loc7_,_axis11,_loc6_,param3))
         {
            return false;
         }
         _axis12.x = _loc5_.m02;
         _axis12.y = _loc5_.m12;
         _axis12.z = _loc5_.m22;
         if(!this.testOverlapOnMainAxis(_loc4_,_loc7_,_axis12,_loc6_,param3))
         {
            return false;
         }
         _axis20.x = _loc8_.m00;
         _axis20.y = _loc8_.m10;
         _axis20.z = _loc8_.m20;
         if(!this.testOverlapOnMainAxis(_loc4_,_loc7_,_axis20,_loc6_,param3))
         {
            return false;
         }
         _axis21.x = _loc8_.m01;
         _axis21.y = _loc8_.m11;
         _axis21.z = _loc8_.m21;
         if(!this.testOverlapOnMainAxis(_loc4_,_loc7_,_axis21,_loc6_,param3))
         {
            return false;
         }
         _axis22.x = _loc8_.m02;
         _axis22.y = _loc8_.m12;
         _axis22.z = _loc8_.m22;
         if(!this.testOverlapOnMainAxis(_loc4_,_loc7_,_axis22,_loc6_,param3))
         {
            return false;
         }
         if(!this.testOverlapOnDerivedAxis(_loc4_,_loc7_,_axis10,_axis20,_loc6_,param3))
         {
            return false;
         }
         if(!this.testOverlapOnDerivedAxis(_loc4_,_loc7_,_axis10,_axis21,_loc6_,param3))
         {
            return false;
         }
         if(!this.testOverlapOnDerivedAxis(_loc4_,_loc7_,_axis10,_axis22,_loc6_,param3))
         {
            return false;
         }
         if(!this.testOverlapOnDerivedAxis(_loc4_,_loc7_,_axis11,_axis20,_loc6_,param3))
         {
            return false;
         }
         if(!this.testOverlapOnDerivedAxis(_loc4_,_loc7_,_axis11,_axis21,_loc6_,param3))
         {
            return false;
         }
         if(!this.testOverlapOnDerivedAxis(_loc4_,_loc7_,_axis11,_axis22,_loc6_,param3))
         {
            return false;
         }
         if(!this.testOverlapOnDerivedAxis(_loc4_,_loc7_,_axis12,_axis20,_loc6_,param3))
         {
            return false;
         }
         if(!this.testOverlapOnDerivedAxis(_loc4_,_loc7_,_axis12,_axis21,_loc6_,param3))
         {
            return false;
         }
         return this.testOverlapOnDerivedAxis(_loc4_,_loc7_,_axis12,_axis22,_loc6_,param3);
      }
      
      private function testOverlapOnMainAxis(param1:CollisionBox, param2:CollisionBox, param3:Vector3, param4:Vector3, param5:Boolean = false) : Boolean
      {
         var _loc6_:Number = this.getOverlapOnAxis(param1,param2,param3,param4,param5);
         return this.registerOverlap(_loc6_,param3);
      }
      
      private function testOverlapOnDerivedAxis(param1:CollisionBox, param2:CollisionBox, param3:Vector3, param4:Vector3, param5:Vector3, param6:Boolean = false) : Boolean
      {
         var _loc7_:Vector3 = null;
         var _loc8_:Number = NaN;
         (_loc7_ = _axis).x = param3.y * param4.z - param3.z * param4.y;
         _loc7_.y = param3.z * param4.x - param3.x * param4.z;
         _loc7_.z = param3.x * param4.y - param3.y * param4.x;
         var _loc9_:Number = _loc7_.x * _loc7_.x + _loc7_.y * _loc7_.y + _loc7_.z * _loc7_.z;
         if(_loc9_ < 1e-10)
         {
            return true;
         }
         _loc8_ = 1 / Math.sqrt(_loc9_);
         _loc7_.x *= _loc8_;
         _loc7_.y *= _loc8_;
         _loc7_.z *= _loc8_;
         var _loc10_:Number = this.getOverlapOnAxis(param1,param2,_loc7_,param5,param6);
         return this.registerOverlap(_loc10_,_loc7_);
      }
      
      private function registerOverlap(param1:Number, param2:Vector3) : Boolean
      {
         if(param1 < this.epsilon)
         {
            return false;
         }
         if(param1 + this.epsilon < this.minOverlap)
         {
            this.minOverlap = param1;
            this.minOverlapAxis.x = param2.x;
            this.minOverlapAxis.y = param2.y;
            this.minOverlapAxis.z = param2.z;
         }
         return true;
      }
      
      public function getOverlapOnAxis(param1:CollisionBox, param2:CollisionBox, param3:Vector3, param4:Vector3, param5:Boolean = false) : Number
      {
         var _loc6_:Matrix4 = param1.transform;
         var _loc7_:Number;
         if((_loc7_ = (_loc6_.m00 * param3.x + _loc6_.m10 * param3.y + _loc6_.m20 * param3.z) * param1.hs.x) < 0)
         {
            _loc7_ = -_loc7_;
         }
         var _loc8_:Number = _loc7_;
         _loc7_ = (_loc6_.m01 * param3.x + _loc6_.m11 * param3.y + _loc6_.m21 * param3.z) * param1.hs.y;
         if(_loc7_ < 0)
         {
            _loc7_ = -_loc7_;
         }
         _loc8_ += _loc7_;
         _loc7_ = (_loc6_.m02 * param3.x + _loc6_.m12 * param3.y + _loc6_.m22 * param3.z) * param1.hs.z;
         if(_loc7_ < 0)
         {
            _loc7_ = -_loc7_;
         }
         _loc8_ += _loc7_;
         _loc6_ = param2.transform;
         if((_loc7_ = (_loc6_.m00 * param3.x + _loc6_.m10 * param3.y + _loc6_.m20 * param3.z) * param2.hs.x) < 0)
         {
            _loc7_ = -_loc7_;
         }
         _loc8_ += _loc7_;
         _loc7_ = (_loc6_.m01 * param3.x + _loc6_.m11 * param3.y + _loc6_.m21 * param3.z) * param2.hs.y;
         if(_loc7_ < 0)
         {
            _loc7_ = -_loc7_;
         }
         _loc8_ += _loc7_;
         _loc7_ = (_loc6_.m02 * param3.x + _loc6_.m12 * param3.y + _loc6_.m22 * param3.z) * param2.hs.z;
         if(_loc7_ < 0)
         {
            _loc7_ = -_loc7_;
         }
         _loc8_ += _loc7_;
         _loc7_ = param4.x * param3.x + param4.y * param3.y + param4.z * param3.z;
         if(_loc7_ < 0)
         {
            _loc7_ = -_loc7_;
         }
         if(param5)
         {
         }
         return _loc8_ - _loc7_;
      }
      
      private function findContacts(param1:CollisionBox, param2:CollisionBox, param3:Vector3, param4:Vector.<ShapeContact>) : void
      {
         var _loc5_:Matrix4 = param1.transform;
         var _loc6_:Matrix4 = param2.transform;
         var _loc7_:Vector3;
         (_loc7_ = _vectorToBox).x = _loc5_.m03 - _loc6_.m03;
         _loc7_.y = _loc5_.m13 - _loc6_.m13;
         _loc7_.z = _loc5_.m23 - _loc6_.m23;
         if(param3.x * _loc7_.x + param3.y * _loc7_.y + param3.z * _loc7_.z < 0)
         {
            param3.x = -param3.x;
            param3.y = -param3.y;
            param3.z = -param3.z;
         }
         var _loc8_:Matrix4 = _basisMatrix;
         ColliderUtils.buildContactBasis(param3,_loc5_,_loc6_,_loc8_);
         ColliderUtils.getBoxFaceVerticesInCCWOrder(param1,param3,FaceSide.BACK,faceVertices1);
         ColliderUtils.getBoxFaceVerticesInCCWOrder(param2,param3,FaceSide.FRONT,faceVertices2);
         ColliderUtils.transformFaceToReferenceSpace(_loc8_,param1.transform,faceVertices1,4);
         ColliderUtils.transformFaceToReferenceSpace(_loc8_,param2.transform,faceVertices2,4);
         PolygonsIntersectionUtils.findContacts(param1,faceVertices1,4,param2,faceVertices2,4,_loc8_,param4);
      }
   }
}

