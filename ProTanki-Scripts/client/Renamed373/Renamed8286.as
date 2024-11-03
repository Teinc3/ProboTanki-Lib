package Renamed373
{
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.BodyContact;
   import alternativa.physics.ShapeContact;
   import alternativa.physics.collision.Collider;
   import alternativa.physics.collision.CollisionDetector;
   import alternativa.physics.collision.CollisionKdNode;
   import alternativa.physics.collision.CollisionKdTree;
   import alternativa.physics.collision.CollisionShape;
   import alternativa.physics.collision.IRayCollisionFilter;
   import alternativa.physics.collision.colliders.BoxBoxCollider;
   import alternativa.physics.collision.colliders.BoxRectCollider;
   import alternativa.physics.collision.colliders.BoxTriangleCollider;
   import alternativa.physics.collision.types.AABB;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.objects.tank.Tank;
   
   public class Renamed665 implements CollisionDetector
   {
      private static const Renamed8262:Number = 0.01;
      
      private var Renamed8263:CollisionKdTree;
      
      private var threshold:Number = 0.0001;
      
      private var Renamed8264:Vector.<Renamed606>;
      
      private var Renamed8265:Body;
      
      public function Renamed665()
      {
         this.colliders = {};
         this.Renamed672 = new RayHit();
         this.Renamed5641 = new Renamed8266();
         this.Renamed8267 = new Vector3();
         this.Renamed8268 = new Vector3();
         this.Renamed8269 = new RayHit();
         this.Renamed8270 = new AABB();
         this.shapeContacts = new Vector.<ShapeContact>();
         this.Renamed8263 = new CollisionKdTree();
         this.Renamed8264 = new Vector.<Renamed606>();
         super();
         var _loc1_:Number = 0.000001;
         this.Renamed8271(CollisionShape.BOX,CollisionShape.BOX,new BoxBoxCollider(_loc1_));
         this.Renamed8271(CollisionShape.BOX,CollisionShape.RECT,new BoxRectCollider(_loc1_));
         this.Renamed8271(CollisionShape.BOX,CollisionShape.TRIANGLE,new BoxTriangleCollider(_loc1_));
         this.Renamed8272();
      }
      
      private function Renamed8271(param1:int, param2:int, param3:Collider) : void
      {
         this.colliders[param1 | param2] = param3;
      }
      
      private function Renamed8272() : void
      {
         this.Renamed8265 = new Body(1,new Matrix3(),10000000000);
         this.Renamed8265.movable = false;
      }
      
      public function Renamed8273(param1:Vector.<CollisionShape>, param2:AABB = null) : void
      {
         var _loc3_:CollisionShape = null;
         for each(_loc3_ in param1)
         {
            _loc3_.body = this.Renamed8265;
         }
         this.Renamed8263.createTree(param1,param2);
      }
      
      public function Renamed8274(param1:Renamed606) : void
      {
         param1.Renamed1008 = false;
         this.Renamed8264.push(param1);
      }
      
      public function Renamed8275(param1:Renamed606) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this.Renamed8264.indexOf(param1));
         if(_loc3_ > -1)
         {
            _loc2_ = int(this.Renamed8264.length - 1);
            this.Renamed8264[_loc3_] = this.Renamed8264[_loc2_];
            this.Renamed8264.length = _loc2_;
         }
      }
      
      public function getTankBodies() : Vector.<Renamed606>
      {
         return this.Renamed8264;
      }
      
      public function getBodyContacts(param1:Vector.<BodyContact>) : void
      {
         var _loc2_:Renamed606 = null;
         var _loc3_:Tank = null;
         var _loc4_:int = 0;
         var _loc5_:int = int(this.Renamed8264.length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc2_ = this.Renamed8264[_loc6_];
            _loc2_.Renamed8276 = _loc2_.Renamed1008;
            _loc3_ = _loc2_.body.tank;
            _loc2_.Renamed1008 = _loc3_.Renamed1104();
            _loc2_.Renamed1012.length = 0;
            _loc6_++;
         }
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc2_ = this.Renamed8264[_loc6_];
            _loc4_ = int(param1.length);
            this.Renamed8277(_loc2_,param1);
            if(_loc4_ != param1.length)
            {
               _loc2_.Renamed1008 = true;
            }
            _loc4_ = int(param1.length);
            this.Renamed8278(_loc2_,_loc6_ + 1,param1);
            _loc6_++;
         }
      }
      
      public function Renamed8279(param1:CollisionShape, param2:Vector.<ShapeContact>) : void
      {
         return this.Renamed8280(this.Renamed8263.rootNode,param1,param2);
      }
      
      private function Renamed8277(param1:Renamed606, param2:Vector.<BodyContact>) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:BodyContact = null;
         if(!param1.body.frozen)
         {
            _loc3_ = int(param1.Renamed1133.length);
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               this.Renamed8280(this.Renamed8263.rootNode,param1.Renamed1133[_loc4_],this.shapeContacts);
               _loc4_++;
            }
            if(this.shapeContacts.length > 0)
            {
               (_loc5_ = BodyContact.create()).body1 = param1.body;
               _loc5_.body2 = this.Renamed8265;
               _loc5_.setShapeContacts(this.shapeContacts);
               this.shapeContacts.length = 0;
               param2[param2.length] = _loc5_;
            }
         }
      }
      
      private function Renamed8278(param1:Renamed606, param2:int, param3:Vector.<BodyContact>) : void
      {
         var _loc4_:Renamed606 = null;
         var _loc5_:Body = null;
         var _loc6_:Body = null;
         var _loc7_:int = 0;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:BodyContact = null;
         var _loc11_:int = 0;
         var _loc12_:ShapeContact = null;
         var _loc13_:int = int(this.Renamed8264.length);
         var _loc14_:int = param2;
         while(_loc14_ < _loc13_)
         {
            _loc4_ = this.Renamed8264[_loc14_];
            _loc5_ = param1.body;
            _loc6_ = _loc4_.body;
            if(!(_loc5_.frozen && _loc6_.frozen) && _loc5_.aabb.intersects(_loc6_.aabb,Renamed8262))
            {
               this.getContacts(param1.Renamed1043,_loc4_.Renamed1043,this.shapeContacts);
               _loc7_ = int(this.shapeContacts.length);
               if(_loc7_ > 0)
               {
                  _loc8_ = _loc5_.postCollisionFilter == null || _loc5_.postCollisionFilter.considerBodies(_loc5_,_loc6_);
                  _loc9_ = _loc6_.postCollisionFilter == null || _loc6_.postCollisionFilter.considerBodies(_loc6_,_loc5_);
                  if(_loc8_ && _loc9_)
                  {
                     (_loc10_ = BodyContact.create()).body1 = _loc5_;
                     _loc10_.body2 = _loc6_;
                     _loc10_.setShapeContacts(this.shapeContacts);
                     param3[param3.length] = _loc10_;
                     param1.Renamed1012.push(_loc6_);
                     _loc4_.Renamed1012.push(_loc5_);
                  }
                  else
                  {
                     _loc11_ = 0;
                     while(_loc11_ < _loc7_)
                     {
                        _loc12_ = this.shapeContacts[_loc11_];
                        _loc12_.dispose();
                        _loc11_++;
                     }
                  }
                  this.shapeContacts.length = 0;
               }
            }
            _loc14_++;
         }
      }
      
      public function getContacts(param1:CollisionShape, param2:CollisionShape, param3:Vector.<ShapeContact>) : void
      {
         if((param1.collisionGroup & param2.collisionGroup) == 0)
         {
            return;
         }
         if(param1.body == param2.body)
         {
            return;
         }
         if(!param1.aabb.intersects(param2.aabb,Renamed8262))
         {
            return;
         }
         var _loc4_:Collider = this.colliders[param1.type | param2.type];
         _loc4_.getContacts(param1,param2,param3);
      }
      
      public function testCollision(param1:CollisionShape, param2:CollisionShape) : Boolean
      {
         if((param1.collisionGroup & param2.collisionGroup) == 0)
         {
            return false;
         }
         if(param1.body == param2.body)
         {
            return false;
         }
         if(!param1.aabb.intersects(param2.aabb,Renamed8262))
         {
            return false;
         }
         var _loc3_:Collider = this.colliders[param1.type | param2.type];
         return _loc3_.haveCollision(param1,param2);
      }
      
      public function raycast(param1:Vector3, param2:Vector3, param3:int, param4:Number, param5:IRayCollisionFilter, param6:RayHit) : Boolean
      {
         var _loc7_:Boolean = this.raycastStatic(param1,param2,param3,param4,param5,param6);
         var _loc8_:Boolean = this.Renamed8281(param1,param2,param3,param4,param5,this.Renamed8269);
         if(!((_loc8_) || _loc7_))
         {
            return false;
         }
         if(_loc8_ && _loc7_)
         {
            if(param6.t > this.Renamed8269.t)
            {
               param6.copy(this.Renamed8269);
            }
            this.Renamed8269.clear();
            return true;
         }
         if(_loc7_)
         {
            this.Renamed8269.clear();
            return true;
         }
         param6.copy(this.Renamed8269);
         this.Renamed8269.clear();
         return true;
      }
      
      public function raycastStatic(param1:Vector3, param2:Vector3, param3:int, param4:Number, param5:IRayCollisionFilter, param6:RayHit) : Boolean
      {
         if(!this.Renamed8282(param1,param2,this.Renamed8263.rootNode.boundBox,this.Renamed5641))
         {
            return false;
         }
         if(this.Renamed5641.max < 0 || this.Renamed5641.min > param4)
         {
            return false;
         }
         if(this.Renamed5641.min <= 0)
         {
            this.Renamed5641.min = 0;
            this.Renamed8268.x = param1.x;
            this.Renamed8268.y = param1.y;
            this.Renamed8268.z = param1.z;
         }
         else
         {
            this.Renamed8268.x = param1.x + this.Renamed5641.min * param2.x;
            this.Renamed8268.y = param1.y + this.Renamed5641.min * param2.y;
            this.Renamed8268.z = param1.z + this.Renamed5641.min * param2.z;
         }
         if(this.Renamed5641.max > param4)
         {
            this.Renamed5641.max = param4;
         }
         var _loc7_:Boolean = this.Renamed8283(this.Renamed8263.rootNode,param1,this.Renamed8268,param2,param3,this.Renamed5641.min,this.Renamed5641.max,param5,param6);
         return _loc7_ ? Boolean(param6.t <= param4) : Boolean(false);
      }
      
      public function hasStaticHit(param1:Vector3, param2:Vector3, param3:int, param4:Number, param5:IRayCollisionFilter = null) : Boolean
      {
         var _loc6_:Boolean = this.raycastStatic(param1,param2,param3,param4,param5,this.Renamed672);
         this.Renamed672.clear();
         return _loc6_;
      }
      
      private function Renamed8280(param1:CollisionKdNode, param2:CollisionShape, param3:Vector.<ShapeContact>) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Vector.<CollisionShape> = null;
         var _loc7_:Vector.<int> = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         if(param1.indices != null)
         {
            _loc6_ = this.Renamed8263.staticChildren;
            _loc7_ = param1.indices;
            _loc8_ = int(_loc7_.length);
            _loc9_ = 0;
            while(_loc9_ < _loc8_)
            {
               this.getContacts(param2,_loc6_[_loc7_[_loc9_]],param3);
               _loc9_++;
            }
         }
         if(param1.axis == -1)
         {
            return;
         }
         switch(param1.axis)
         {
            case 0:
               _loc4_ = param2.aabb.minX;
               _loc5_ = param2.aabb.maxX;
               break;
            case 1:
               _loc4_ = param2.aabb.minY;
               _loc5_ = param2.aabb.maxY;
               break;
            case 2:
               _loc4_ = param2.aabb.minZ;
               _loc5_ = param2.aabb.maxZ;
         }
         if(_loc4_ < param1.coord)
         {
            this.Renamed8280(param1.negativeNode,param2,param3);
         }
         if(_loc5_ > param1.coord)
         {
            this.Renamed8280(param1.positiveNode,param2,param3);
         }
         if(param1.splitTree != null && _loc4_ < param1.coord && _loc5_ > param1.coord)
         {
            this.Renamed8280(param1.splitTree.rootNode,param2,param3);
         }
      }
      
      private function Renamed8284(param1:CollisionShape, param2:CollisionKdNode) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Vector.<CollisionShape> = null;
         var _loc6_:Vector.<int> = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         if(param2.indices != null)
         {
            _loc5_ = this.Renamed8263.staticChildren;
            _loc6_ = param2.indices;
            _loc7_ = int(_loc6_.length);
            _loc8_ = 0;
            while(_loc8_ < _loc7_)
            {
               if(this.testCollision(param1,_loc5_[_loc6_[_loc8_]]))
               {
                  return true;
               }
               _loc8_++;
            }
         }
         if(param2.axis == -1)
         {
            return false;
         }
         switch(param2.axis)
         {
            case 0:
               _loc3_ = param1.aabb.minX;
               _loc4_ = param1.aabb.maxX;
               break;
            case 1:
               _loc3_ = param1.aabb.minY;
               _loc4_ = param1.aabb.maxY;
               break;
            case 2:
               _loc3_ = param1.aabb.minZ;
               _loc4_ = param1.aabb.maxZ;
         }
         if(param2.splitTree != null && _loc3_ < param2.coord && _loc4_ > param2.coord)
         {
            if(this.Renamed8284(param1,param2.splitTree.rootNode))
            {
               return true;
            }
         }
         if(_loc3_ < param2.coord)
         {
            if(this.Renamed8284(param1,param2.negativeNode))
            {
               return true;
            }
         }
         if(_loc4_ > param2.coord)
         {
            if(this.Renamed8284(param1,param2.positiveNode))
            {
               return true;
            }
         }
         return false;
      }
      
      private function Renamed8281(param1:Vector3, param2:Vector3, param3:int, param4:Number, param5:IRayCollisionFilter, param6:RayHit) : Boolean
      {
         var _loc7_:Renamed606 = null;
         var _loc8_:Body = null;
         var _loc9_:AABB = null;
         var _loc10_:int = 0;
         var _loc11_:CollisionShape = null;
         var _loc12_:Number = NaN;
         var _loc13_:Number = param1.x + param2.x * param4;
         var _loc14_:Number = param1.y + param2.y * param4;
         var _loc15_:Number = param1.z + param2.z * param4;
         if(_loc13_ < param1.x)
         {
            this.Renamed8270.minX = _loc13_;
            this.Renamed8270.maxX = param1.x;
         }
         else
         {
            this.Renamed8270.minX = param1.x;
            this.Renamed8270.maxX = _loc13_;
         }
         if(_loc14_ < param1.y)
         {
            this.Renamed8270.minY = _loc14_;
            this.Renamed8270.maxY = param1.y;
         }
         else
         {
            this.Renamed8270.minY = param1.y;
            this.Renamed8270.maxY = _loc14_;
         }
         if(_loc15_ < param1.z)
         {
            this.Renamed8270.minZ = _loc15_;
            this.Renamed8270.maxZ = param1.z;
         }
         else
         {
            this.Renamed8270.minZ = param1.z;
            this.Renamed8270.maxZ = _loc15_;
         }
         var _loc16_:Number = param4 + 1;
         var _loc17_:int = int(this.Renamed8264.length);
         var _loc18_:int = 0;
         while(_loc18_ < _loc17_)
         {
            _loc7_ = this.Renamed8264[_loc18_];
            _loc9_ = (_loc8_ = _loc7_.body).aabb;
            if(!(this.Renamed8270.maxX < _loc9_.minX || this.Renamed8270.minX > _loc9_.maxX || this.Renamed8270.maxY < _loc9_.minY || this.Renamed8270.minY > _loc9_.maxY || this.Renamed8270.maxZ < _loc9_.minZ || this.Renamed8270.minZ > _loc9_.maxZ))
            {
               _loc10_ = 0;
               while(_loc10_ < _loc8_.numCollisionShapes)
               {
                  _loc11_ = _loc8_.collisionShapes[_loc10_];
                  if((_loc11_.collisionGroup & param3) != 0)
                  {
                     _loc9_ = _loc11_.aabb;
                     if(!(this.Renamed8270.maxX < _loc9_.minX || this.Renamed8270.minX > _loc9_.maxX || this.Renamed8270.maxY < _loc9_.minY || this.Renamed8270.minY > _loc9_.maxY || this.Renamed8270.maxZ < _loc9_.minZ || this.Renamed8270.minZ > _loc9_.maxZ))
                     {
                        if(!(param5 != null && !param5.considerBody(_loc8_)))
                        {
                           _loc12_ = _loc11_.raycast(param1,param2,this.threshold,this.Renamed8267);
                           if(_loc12_ >= 0 && _loc12_ < _loc16_)
                           {
                              _loc16_ = _loc12_;
                              param6.shape = _loc11_;
                              param6.normal.x = this.Renamed8267.x;
                              param6.normal.y = this.Renamed8267.y;
                              param6.normal.z = this.Renamed8267.z;
                           }
                        }
                     }
                  }
                  _loc10_++;
               }
            }
            _loc18_++;
         }
         if(_loc16_ > param4)
         {
            return false;
         }
         param6.position.x = param1.x + param2.x * _loc16_;
         param6.position.y = param1.y + param2.y * _loc16_;
         param6.position.z = param1.z + param2.z * _loc16_;
         param6.t = _loc16_;
         return true;
      }
      
      private function Renamed8282(param1:Vector3, param2:Vector3, param3:AABB, param4:Renamed8266) : Boolean
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         param4.min = -1;
         param4.max = 1e+308;
         var _loc7_:int = 0;
         for(; _loc7_ < 3; _loc7_++)
         {
            switch(_loc7_)
            {
               case 0:
                  if(!(param2.x < this.threshold && param2.x > -this.threshold))
                  {
                     _loc5_ = (param3.minX - param1.x) / param2.x;
                     _loc6_ = (param3.maxX - param1.x) / param2.x;
                     break;
                  }
                  if(param1.x < param3.minX || param1.x > param3.maxX)
                  {
                     return false;
                  }
                  continue;
               case 1:
                  if(!(param2.y < this.threshold && param2.y > -this.threshold))
                  {
                     _loc5_ = (param3.minY - param1.y) / param2.y;
                     _loc6_ = (param3.maxY - param1.y) / param2.y;
                     break;
                  }
                  if(param1.y < param3.minY || param1.y > param3.maxY)
                  {
                     return false;
                  }
                  continue;
               case 2:
                  if(!(param2.z < this.threshold && param2.z > -this.threshold))
                  {
                     _loc5_ = (param3.minZ - param1.z) / param2.z;
                     _loc6_ = (param3.maxZ - param1.z) / param2.z;
                     break;
                  }
                  if(param1.z < param3.minZ || param1.z > param3.maxZ)
                  {
                     return false;
                  }
                  continue;
            }
            if(_loc5_ < _loc6_)
            {
               if(_loc5_ > param4.min)
               {
                  param4.min = _loc5_;
               }
               if(_loc6_ < param4.max)
               {
                  param4.max = _loc6_;
               }
            }
            else
            {
               if(_loc6_ > param4.min)
               {
                  param4.min = _loc6_;
               }
               if(_loc5_ < param4.max)
               {
                  param4.max = _loc5_;
               }
            }
            if(param4.max < param4.min)
            {
               return false;
            }
         }
         return true;
      }
      
      private function Renamed8283(param1:CollisionKdNode, param2:Vector3, param3:Vector3, param4:Vector3, param5:int, param6:Number, param7:Number, param8:IRayCollisionFilter, param9:RayHit) : Boolean
      {
         var _loc10_:Number = NaN;
         var _loc11_:CollisionKdNode = null;
         var _loc12_:Boolean = false;
         var _loc13_:CollisionKdNode = null;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:CollisionShape = null;
         if(param1.indices != null && this.Renamed8285(param2,param4,param5,this.Renamed8263.staticChildren,param1.indices,param8,param9))
         {
            return true;
         }
         if(param1.axis == -1)
         {
            return false;
         }
         switch(param1.axis)
         {
            case 0:
               if(param4.x > -this.threshold && param4.x < this.threshold)
               {
                  _loc10_ = param7 + 1;
               }
               else
               {
                  _loc10_ = (param1.coord - param2.x) / param4.x;
               }
               _loc11_ = param3.x < param1.coord ? param1.negativeNode : param1.positiveNode;
               break;
            case 1:
               if(param4.y > -this.threshold && param4.y < this.threshold)
               {
                  _loc10_ = param7 + 1;
               }
               else
               {
                  _loc10_ = (param1.coord - param2.y) / param4.y;
               }
               _loc11_ = param3.y < param1.coord ? param1.negativeNode : param1.positiveNode;
               break;
            case 2:
               if(param4.z > -this.threshold && param4.z < this.threshold)
               {
                  _loc10_ = param7 + 1;
               }
               else
               {
                  _loc10_ = (param1.coord - param2.z) / param4.z;
               }
               _loc11_ = param3.z < param1.coord ? param1.negativeNode : param1.positiveNode;
         }
         if(_loc10_ < param6 || _loc10_ > param7)
         {
            return this.Renamed8283(_loc11_,param2,param3,param4,param5,param6,param7,param8,param9);
         }
         _loc12_ = this.Renamed8283(_loc11_,param2,param3,param4,param5,param6,_loc10_,param8,param9);
         if(_loc12_)
         {
            return true;
         }
         this.Renamed8268.x = param2.x + _loc10_ * param4.x;
         this.Renamed8268.y = param2.y + _loc10_ * param4.y;
         this.Renamed8268.z = param2.z + _loc10_ * param4.z;
         if(param1.splitTree != null)
         {
            _loc13_ = param1.splitTree.rootNode;
            while(_loc13_ != null && _loc13_.axis != -1)
            {
               switch(_loc13_.axis)
               {
                  case 0:
                     _loc13_ = this.Renamed8268.x < _loc13_.coord ? _loc13_.negativeNode : _loc13_.positiveNode;
                     break;
                  case 1:
                     _loc13_ = this.Renamed8268.y < _loc13_.coord ? _loc13_.negativeNode : _loc13_.positiveNode;
                     break;
                  case 2:
                     _loc13_ = this.Renamed8268.z < _loc13_.coord ? _loc13_.negativeNode : _loc13_.positiveNode;
                     break;
               }
            }
            if(_loc13_ != null && _loc13_.indices != null)
            {
               _loc14_ = int(_loc13_.indices.length);
               _loc15_ = 0;
               while(_loc15_ < _loc14_)
               {
                  _loc16_ = this.Renamed8263.staticChildren[_loc13_.indices[_loc15_]];
                  if((_loc16_.collisionGroup & param5) != 0)
                  {
                     if(!(param8 != null && !param8.considerBody(_loc16_.body)))
                     {
                        param9.t = _loc16_.raycast(param2,param4,this.threshold,param9.normal);
                        if(param9.t >= 0)
                        {
                           param9.position.copy(this.Renamed8268);
                           param9.shape = _loc16_;
                           return true;
                        }
                     }
                  }
                  _loc15_++;
               }
            }
         }
         return this.Renamed8283(_loc11_ == param1.negativeNode ? param1.positiveNode : param1.negativeNode,param2,this.Renamed8268,param4,param5,_loc10_,param7,param8,param9);
      }
      
      private function Renamed8285(param1:Vector3, param2:Vector3, param3:int, param4:Vector.<CollisionShape>, param5:Vector.<int>, param6:IRayCollisionFilter, param7:RayHit) : Boolean
      {
         var _loc8_:CollisionShape = null;
         var _loc9_:Number = NaN;
         var _loc10_:int = int(param5.length);
         var _loc11_:Number = 1e+308;
         var _loc12_:int = 0;
         while(_loc12_ < _loc10_)
         {
            _loc8_ = param4[param5[_loc12_]];
            if((_loc8_.collisionGroup & param3) != 0)
            {
               if(!(param6 != null && !param6.considerBody(_loc8_.body)))
               {
                  _loc9_ = _loc8_.raycast(param1,param2,this.threshold,this.Renamed8267);
                  if(_loc9_ > 0 && _loc9_ < _loc11_)
                  {
                     _loc11_ = _loc9_;
                     param7.shape = _loc8_;
                     param7.normal.x = this.Renamed8267.x;
                     param7.normal.y = this.Renamed8267.y;
                     param7.normal.z = this.Renamed8267.z;
                  }
               }
            }
            _loc12_++;
         }
         if(_loc11_ == 1e+308)
         {
            return false;
         }
         param7.position.x = param1.x + param2.x * _loc11_;
         param7.position.y = param1.y + param2.y * _loc11_;
         param7.position.z = param1.z + param2.z * _loc11_;
         param7.t = _loc11_;
         return true;
      }
      
      public function Renamed3414(param1:CollisionShape) : Boolean
      {
         return this.Renamed8284(param1,this.Renamed8263.rootNode);
      }
      
      public function destroy() : void
      {
         var _loc1_:Renamed606 = null;
         this.Renamed8263.destroyTree();
         this.Renamed8263 = null;
         for each(_loc1_ in this.Renamed8264)
         {
            _loc1_.destroy();
         }
         this.Renamed8264.length = 0;
         this.Renamed8265 = null;
      }
   }
}

