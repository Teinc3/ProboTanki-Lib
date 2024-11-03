package alternativa.physics.collision.colliders
{
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.physics.ShapeContact;
   import alternativa.physics.collision.Collider;
   import alternativa.physics.collision.CollisionShape;
   import alternativa.physics.collision.primitives.CollisionBox;
   import alternativa.physics.collision.primitives.CollisionSphere;
   
   public class BoxSphereCollider implements Collider
   {
      private var center:Vector3;
      
      private var closestPoint:Vector3;
      
      private var boxPosition:Vector3;
      
      private var spherePosition:Vector3;
      
      public function BoxSphereCollider()
      {
         this.center = new Vector3();
         this.closestPoint = new Vector3();
         this.boxPosition = new Vector3();
         this.spherePosition = new Vector3();
         super();
      }
      
      public function getContacts(param1:CollisionShape, param2:CollisionShape, param3:Vector.<ShapeContact>) : void
      {
         var _loc4_:CollisionBox = null;
         var _loc5_:Matrix4 = null;
         var _loc6_:CollisionSphere = param1 as CollisionSphere;
         if(_loc6_ == null)
         {
            _loc6_ = param2 as CollisionSphere;
            _loc4_ = param1 as CollisionBox;
         }
         else
         {
            _loc4_ = param2 as CollisionBox;
         }
         var _loc7_:Matrix4 = _loc6_.transform;
         _loc7_.getAxis(3,this.spherePosition);
         _loc5_ = _loc4_.transform;
         _loc5_.getAxis(3,this.boxPosition);
         _loc5_.transformVectorInverse(this.spherePosition,this.center);
         var _loc8_:Vector3 = _loc4_.hs;
         var _loc9_:Number = _loc8_.x + _loc6_.r;
         var _loc10_:Number = _loc8_.y + _loc6_.r;
         var _loc11_:Number = _loc8_.z + _loc6_.r;
         if(this.center.x > _loc9_ || this.center.x < -_loc9_ || this.center.y > _loc10_ || this.center.y < -_loc10_ || this.center.z > _loc11_ || this.center.z < -_loc11_)
         {
            return;
         }
         if(this.center.x > _loc8_.x)
         {
            this.closestPoint.x = _loc8_.x;
         }
         else if(this.center.x < -_loc8_.x)
         {
            this.closestPoint.x = -_loc8_.x;
         }
         else
         {
            this.closestPoint.x = this.center.x;
         }
         if(this.center.y > _loc8_.y)
         {
            this.closestPoint.y = _loc8_.y;
         }
         else if(this.center.y < -_loc8_.y)
         {
            this.closestPoint.y = -_loc8_.y;
         }
         else
         {
            this.closestPoint.y = this.center.y;
         }
         if(this.center.z > _loc8_.z)
         {
            this.closestPoint.z = _loc8_.z;
         }
         else if(this.center.z < -_loc8_.z)
         {
            this.closestPoint.z = -_loc8_.z;
         }
         else
         {
            this.closestPoint.z = this.center.z;
         }
         var _loc12_:Number = this.center.subtract(this.closestPoint).lengthSqr();
         if(_loc12_ > _loc6_.r * _loc6_.r)
         {
            return;
         }
         var _loc13_:ShapeContact;
         (_loc13_ = ShapeContact.create()).shape1 = _loc6_;
         _loc13_.shape2 = _loc4_;
         _loc13_.normal.copy(this.closestPoint).transform4(_loc5_).subtract(this.spherePosition).normalize().reverse();
         _loc13_.penetration = _loc6_.r - Math.sqrt(_loc12_);
         _loc13_.position.copy(_loc13_.normal).scale(-_loc6_.r).add(this.spherePosition);
         param3[param3.length] = _loc13_;
      }
      
      public function haveCollision(param1:CollisionShape, param2:CollisionShape, param3:Boolean = false) : Boolean
      {
         var _loc4_:CollisionBox = null;
         var _loc5_:CollisionSphere = param1 as CollisionSphere;
         if(_loc5_ == null)
         {
            _loc5_ = param2 as CollisionSphere;
            _loc4_ = param1 as CollisionBox;
         }
         else
         {
            _loc4_ = param2 as CollisionBox;
         }
         var _loc6_:Matrix4 = _loc5_.transform;
         _loc6_.getAxis(3,this.spherePosition);
         var _loc7_:Matrix4 = _loc4_.transform;
         _loc7_.getAxis(3,this.boxPosition);
         _loc7_.transformVectorInverse(this.spherePosition,this.center);
         var _loc8_:Vector3 = _loc4_.hs;
         var _loc9_:Number = _loc8_.x + _loc5_.r;
         var _loc10_:Number = _loc8_.y + _loc5_.r;
         var _loc11_:Number = _loc8_.z + _loc5_.r;
         if(this.center.x > _loc9_ || this.center.x < -_loc9_ || this.center.y > _loc10_ || this.center.y < -_loc10_ || this.center.z > _loc11_ || this.center.z < -_loc11_)
         {
            return false;
         }
         if(this.center.x > _loc8_.x)
         {
            this.closestPoint.x = _loc8_.x;
         }
         else if(this.center.x < -_loc8_.x)
         {
            this.closestPoint.x = -_loc8_.x;
         }
         else
         {
            this.closestPoint.x = this.center.x;
         }
         if(this.center.y > _loc8_.y)
         {
            this.closestPoint.y = _loc8_.y;
         }
         else if(this.center.y < -_loc8_.y)
         {
            this.closestPoint.y = -_loc8_.y;
         }
         else
         {
            this.closestPoint.y = this.center.y;
         }
         if(this.center.z > _loc8_.z)
         {
            this.closestPoint.z = _loc8_.z;
         }
         else if(this.center.z < -_loc8_.z)
         {
            this.closestPoint.z = -_loc8_.z;
         }
         else
         {
            this.closestPoint.z = this.center.z;
         }
         var _loc12_:Number = this.center.subtract(this.closestPoint).lengthSqr();
         return _loc12_ <= _loc5_.r * _loc5_.r;
      }
   }
}

