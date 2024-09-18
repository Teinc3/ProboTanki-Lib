package alternativa.physics.contactislands
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.BodyContact;
   import alternativa.physics.PhysicsScene;
   import alternativa.physics.ShapeContact;
   
   public class ContactIsland
   {
      private static var poolSize:int;
      
      private static const pool:Vector.<ContactIsland> = new Vector.<ContactIsland>();
      
      private static const _relativeVelocity:Vector3 = new Vector3();
      
      private static const COLLISION_MODE:int = 0;
      
      private static const CONTACT_MODE:int = 1;
      
      private var physicsScene:PhysicsScene;
      
      private var prevLevelBodies:Vector.<Body>;
      
      private var levelBodies:Vector.<Body>;
      
      public function ContactIsland()
      {
         this.bodyContacts = new Vector.<BodyContact>();
         this.allShapeContacts = new Vector.<ShapeContact>();
         this.levelShapeContacts = new Vector.<ShapeContact>();
         this.levelBodyContacts = new Vector.<BodyContact>();
         this.contactLevels = new ContactLevels();
         this.prevLevelBodies = new Vector.<Body>();
         this.levelBodies = new Vector.<Body>();
         super();
      }
      
      public static function create() : ContactIsland
      {
         if(poolSize == 0)
         {
            return new ContactIsland();
         }
         --poolSize;
         var _loc1_:ContactIsland = pool[poolSize];
         pool[poolSize] = null;
         return _loc1_;
      }
      
      public function dispose() : void
      {
         this.physicsScene = null;
         this.bodyContacts.length = 0;
         this.allShapeContacts.length = 0;
         this.levelShapeContacts.length = 0;
         this.prevLevelBodies.length = 0;
         this.levelBodies.length = 0;
         this.levelBodyContacts.length = 0;
         this.contactLevels.clear();
         var _loc1_:* = poolSize++;
         pool[_loc1_] = this;
      }
      
      public function init(param1:PhysicsScene) : void
      {
         var _loc2_:BodyContact = null;
         var _loc3_:Vector.<ShapeContact> = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         this.physicsScene = param1;
         var _loc6_:int = int(this.bodyContacts.length);
         var _loc7_:Vector.<ShapeContact> = this.allShapeContacts;
         var _loc8_:int = 0;
         while(_loc8_ < _loc6_)
         {
            _loc2_ = this.bodyContacts[_loc8_];
            _loc3_ = _loc2_.shapeContacts;
            _loc4_ = int(_loc3_.length);
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc7_[_loc7_.length] = _loc3_[_loc5_];
               _loc5_++;
            }
            _loc8_++;
         }
      }
      
      public function collisionPhase(param1:int) : void
      {
         this.resolveCollisions(param1);
      }
      
      public function contactPhase(param1:int) : void
      {
         this.resolveContacts(param1);
      }
      
      private function resolveCollisions(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this.allShapeContacts.length);
         var _loc4_:int = 0;
         while(_loc4_ < param1)
         {
            this.shuffleContacts(this.allShapeContacts);
            _loc2_ = 0;
            while(_loc2_ < _loc3_)
            {
               this.resolveContact(this.allShapeContacts[_loc2_],COLLISION_MODE);
               _loc2_++;
            }
            _loc4_++;
         }
      }
      
      private function resolveContacts(param1:int) : void
      {
         var _loc2_:Vector.<Body> = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:ShapeContact = null;
         this.processContacts(param1);
         this.contactLevels.init(this.bodyContacts);
         this.contactLevels.getStaticLevel(this.levelBodyContacts,this.levelBodies);
         if(this.levelBodyContacts.length > 0)
         {
            this.getShapeContacts(this.levelBodyContacts,this.levelShapeContacts);
            this.resolveContactsForLevel(param1,this.levelShapeContacts);
            this.calculatePseudoVelocities(param1,this.levelShapeContacts);
            while(this.contactLevels.hasContacts())
            {
               _loc2_ = this.prevLevelBodies;
               this.prevLevelBodies = this.levelBodies;
               this.levelBodies = _loc2_;
               this.levelBodyContacts.length = 0;
               this.levelBodies.length = 0;
               this.contactLevels.getNextLevel(this.prevLevelBodies,this.levelBodyContacts,this.levelBodies);
               this.setBodiesMobility(this.prevLevelBodies,false);
               this.levelShapeContacts.length = 0;
               this.getShapeContacts(this.levelBodyContacts,this.levelShapeContacts);
               _loc3_ = int(this.levelShapeContacts.length);
               _loc4_ = 0;
               while(_loc4_ < _loc3_)
               {
                  _loc5_ = this.levelShapeContacts[_loc4_];
                  _loc5_.calcualteDynamicFrameData(this.physicsScene.allowedPenetration,this.physicsScene.penetrationErrorCorrection,this.physicsScene.maxCorrectablePenetration,this.physicsScene.dt);
                  _loc4_++;
               }
               this.resolveContactsForLevel(param1,this.levelShapeContacts);
               this.calculatePseudoVelocities(param1,this.levelShapeContacts);
               this.setBodiesMobility(this.prevLevelBodies,true);
            }
         }
         else
         {
            this.getShapeContacts(this.bodyContacts,this.levelShapeContacts);
            this.resolveContactsForLevel(param1,this.levelShapeContacts);
            this.calculatePseudoVelocities(param1,this.levelShapeContacts);
         }
      }
      
      private function processContacts(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this.allShapeContacts.length);
         var _loc4_:int = 0;
         while(_loc4_ < param1)
         {
            this.shuffleContacts(this.allShapeContacts);
            _loc2_ = 0;
            while(_loc2_ < _loc3_)
            {
               this.resolveContact(this.allShapeContacts[_loc2_],CONTACT_MODE);
               _loc2_++;
            }
            _loc4_++;
         }
      }
      
      private function getShapeContacts(param1:Vector.<BodyContact>, param2:Vector.<ShapeContact>) : void
      {
         var _loc3_:BodyContact = null;
         var _loc4_:Vector.<ShapeContact> = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = int(param1.length);
         var _loc8_:int = 0;
         while(_loc8_ < _loc7_)
         {
            _loc3_ = param1[_loc8_];
            _loc4_ = _loc3_.shapeContacts;
            _loc5_ = int(_loc4_.length);
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               param2[param2.length] = _loc4_[_loc6_];
               _loc6_++;
            }
            _loc8_++;
         }
      }
      
      private function shuffleContacts(param1:Vector.<ShapeContact>) : void
      {
         var _loc2_:int = 0;
         var _loc3_:ShapeContact = null;
         var _loc4_:int = int(param1.length);
         var _loc5_:int = 1;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = _loc5_ * Math.random();
            _loc3_ = param1[_loc2_];
            param1[_loc2_] = param1[_loc5_];
            param1[_loc5_] = _loc3_;
            _loc5_++;
         }
      }
      
      private function resolveContactsForLevel(param1:int, param2:Vector.<ShapeContact>) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         while(_loc5_ < param1)
         {
            this.shuffleContacts(param2);
            _loc3_ = int(param2.length);
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               this.resolveContact(param2[_loc4_],CONTACT_MODE);
               _loc4_++;
            }
            _loc5_++;
         }
      }
      
      private function calculatePseudoVelocities(param1:int, param2:Vector.<ShapeContact>) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         while(_loc5_ < param1)
         {
            this.shuffleContacts(param2);
            _loc3_ = int(param2.length);
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               this.resolveContactPseudoVelocity(param2[_loc4_]);
               _loc4_++;
            }
            _loc5_++;
         }
      }
      
      private function setBodiesMobility(param1:Vector.<Body>, param2:Boolean) : void
      {
         var _loc3_:Body = null;
         var _loc4_:int = int(param1.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param1[_loc5_];
            _loc3_.movable = param2;
            _loc5_++;
         }
      }
      
      private function resolveContact(param1:ShapeContact, param2:int) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Vector3 = param1.normal;
         var _loc6_:Body = param1.shape1.body;
         var _loc7_:Body = param1.shape2.body;
         var _loc8_:Vector3 = _relativeVelocity;
         this.calculateRelativeVelocity(param1,_loc8_);
         var _loc9_:Number = _loc8_.x * _loc5_.x + _loc8_.y * _loc5_.y + _loc8_.z * _loc5_.z;
         if(param2 == CONTACT_MODE)
         {
            _loc3_ = 0;
            if(_loc9_ < 0)
            {
               param1.satisfied = false;
            }
            else if(param1.satisfied)
            {
               return;
            }
         }
         else
         {
            param1.satisfied = true;
            _loc3_ = param1.collisionSpeed;
         }
         var _loc10_:Number = _loc8_.dot(param1.tangent1);
         var _loc11_:Number = _loc8_.dot(param1.tangent2);
         var _loc12_:Number = param1.tangentImpulse1 - _loc10_ / param1.tangentSpeedDelta1;
         var _loc13_:Number = param1.tangentImpulse2 - _loc11_ / param1.tangentSpeedDelta2;
         var _loc14_:Number = _loc12_ * _loc12_ + _loc13_ * _loc13_;
         var _loc15_:Number = param1.friction * param1.normalImpulse;
         if(_loc14_ > _loc15_ * _loc15_)
         {
            _loc4_ = Math.sqrt(_loc14_);
            _loc12_ *= _loc15_ / _loc4_;
            _loc13_ *= _loc15_ / _loc4_;
         }
         var _loc16_:Number = _loc12_ - param1.tangentImpulse1;
         var _loc17_:Number = _loc13_ - param1.tangentImpulse2;
         param1.tangentImpulse1 = _loc12_;
         param1.tangentImpulse2 = _loc13_;
         if(_loc6_.movable)
         {
            _loc6_.applyWorldImpulseAtLocalPoint(param1.r1,param1.tangent1,_loc16_);
            _loc6_.applyWorldImpulseAtLocalPoint(param1.r1,param1.tangent2,_loc17_);
         }
         if(_loc7_.movable)
         {
            _loc7_.applyWorldImpulseAtLocalPoint(param1.r2,param1.tangent1,-_loc16_);
            _loc7_.applyWorldImpulseAtLocalPoint(param1.r2,param1.tangent2,-_loc17_);
         }
         this.calculateRelativeVelocity(param1,_loc8_);
         _loc9_ = _loc8_.x * _loc5_.x + _loc8_.y * _loc5_.y + _loc8_.z * _loc5_.z;
         var _loc18_:Number = _loc3_ - _loc9_;
         var _loc19_:Number = param1.normalImpulse + _loc18_ / param1.normalSpeedDelta;
         if(_loc19_ < 0)
         {
            _loc19_ = 0;
         }
         var _loc20_:Number = _loc19_ - param1.normalImpulse;
         param1.normalImpulse = _loc19_;
         if(_loc6_.movable)
         {
            _loc6_.applyWorldImpulseAtLocalPoint(param1.r1,param1.normal,_loc20_);
         }
         if(_loc7_.movable)
         {
            _loc7_.applyWorldImpulseAtLocalPoint(param1.r2,param1.normal,-_loc20_);
         }
      }
      
      private function calculateRelativeVelocity(param1:ShapeContact, param2:Vector3) : void
      {
         var _loc3_:Vector3 = null;
         var _loc4_:Vector3 = param1.shape1.body.state.angularVelocity;
         _loc3_ = param1.r1;
         var _loc5_:Number = _loc4_.y * _loc3_.z - _loc4_.z * _loc3_.y;
         var _loc6_:Number = _loc4_.z * _loc3_.x - _loc4_.x * _loc3_.z;
         var _loc7_:Number = _loc4_.x * _loc3_.y - _loc4_.y * _loc3_.x;
         _loc3_ = param1.shape1.body.state.velocity;
         param2.x = _loc3_.x + _loc5_;
         param2.y = _loc3_.y + _loc6_;
         param2.z = _loc3_.z + _loc7_;
         _loc4_ = param1.shape2.body.state.angularVelocity;
         _loc3_ = param1.r2;
         _loc5_ = _loc4_.y * _loc3_.z - _loc4_.z * _loc3_.y;
         _loc6_ = _loc4_.z * _loc3_.x - _loc4_.x * _loc3_.z;
         _loc7_ = _loc4_.x * _loc3_.y - _loc4_.y * _loc3_.x;
         _loc3_ = param1.shape2.body.state.velocity;
         param2.x -= _loc3_.x + _loc5_;
         param2.y -= _loc3_.y + _loc6_;
         param2.z -= _loc3_.z + _loc7_;
      }
      
      private function resolveContactPseudoVelocity(param1:ShapeContact) : void
      {
         var _loc2_:Vector3 = _relativeVelocity;
         this.calcPseudoSeparationVelocity(param1,_loc2_);
         var _loc3_:Number = _loc2_.x * param1.normal.x + _loc2_.y * param1.normal.y + _loc2_.z * param1.normal.z;
         var _loc4_:Number = param1.contactSeparationSpeed - _loc3_;
         var _loc5_:Number = _loc4_ / param1.normalSpeedDelta;
         if(param1.shape1.body.movable)
         {
            param1.shape1.body.applyWorldPseudoImpulseAtLocalPoint(param1.r1,param1.normal,_loc5_);
         }
         if(param1.shape2.body.movable)
         {
            param1.shape2.body.applyWorldPseudoImpulseAtLocalPoint(param1.r2,param1.normal,-_loc5_);
         }
      }
      
      private function calcPseudoSeparationVelocity(param1:ShapeContact, param2:Vector3) : void
      {
         var _loc3_:Vector3 = null;
         var _loc4_:Number = NaN;
         var _loc5_:Vector3 = param1.shape1.body.pseudoAngularVelocity;
         _loc3_ = param1.r1;
         var _loc6_:Number = _loc5_.y * _loc3_.z - _loc5_.z * _loc3_.y;
         var _loc7_:Number = _loc5_.z * _loc3_.x - _loc5_.x * _loc3_.z;
         _loc4_ = _loc5_.x * _loc3_.y - _loc5_.y * _loc3_.x;
         _loc3_ = param1.shape1.body.pseudoVelocity;
         param2.x = _loc3_.x + _loc6_;
         param2.y = _loc3_.y + _loc7_;
         param2.z = _loc3_.z + _loc4_;
         _loc5_ = param1.shape2.body.pseudoAngularVelocity;
         _loc3_ = param1.r2;
         _loc6_ = _loc5_.y * _loc3_.z - _loc5_.z * _loc3_.y;
         _loc7_ = _loc5_.z * _loc3_.x - _loc5_.x * _loc3_.z;
         _loc4_ = _loc5_.x * _loc3_.y - _loc5_.y * _loc3_.x;
         _loc3_ = param1.shape2.body.pseudoVelocity;
         param2.x -= _loc3_.x + _loc6_;
         param2.y -= _loc3_.y + _loc7_;
         param2.z -= _loc3_.z + _loc4_;
      }
   }
}

