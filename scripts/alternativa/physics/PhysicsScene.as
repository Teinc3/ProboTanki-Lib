package alternativa.physics
{
   import alternativa.math.Vector3;
   import alternativa.physics.collision.CollisionDetector;
   import alternativa.physics.contactislands.ContactIsland;
   import alternativa.physics.contactislands.IslandsGenerator;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   
   public class PhysicsScene
   {
      private static const thousandth:EncryptedInt = new EncryptedIntImpl(1000);
      
      public var penetrationErrorCorrection:Number = 0.7;
      
      public var maxCorrectablePenetration:Number = 10;
      
      public var allowedPenetration:Number = 0.01;
      
      public var collisionIterations:int = 4;
      
      public var contactIterations:int = 4;
      
      public var freezeSteps:int = 10;
      
      public var linSpeedFreezeLimit:Number = 5;
      
      public var angSpeedFreezeLimit:Number = 0.05;
      
      public var collisionDetector:CollisionDetector;
      
      public var bodies:Vector.<Body>;
      
      public var timeStamp:int;
      
      public var time:int;
      
      public var dt:Number;
      
      private var islandsGenerator:IslandsGenerator;
      
      public function PhysicsScene()
      {
         this.gravity = new Vector3(0,0,-9.8);
         this.bodyContacts = new Vector.<BodyContact>();
         this.bodies = new Vector.<Body>();
         super();
         this.islandsGenerator = new IslandsGenerator(this);
      }
      
      public function addBody(param1:Body) : void
      {
         param1.scene = this;
         param1.id = this.bodies.length;
         this.bodies.push(param1);
      }
      
      public function removeBody(param1:Body) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Body = null;
         var _loc4_:int = int(this.bodies.indexOf(param1));
         if(_loc4_ > -1)
         {
            _loc2_ = int(this.bodies.length - 1);
            _loc3_ = this.bodies[_loc2_];
            this.bodies[_loc4_] = _loc3_;
            _loc3_.id = _loc4_;
            this.bodies.length = _loc2_;
            param1.scene = null;
         }
      }
      
      public function update(param1:int) : void
      {
         ++this.timeStamp;
         this.time += param1;
         this.dt = param1 / thousandth.getInt();
         this.applyForces();
         this.detectCollisions();
         this.prepareBodyContacts(this.bodyContacts,this.dt);
         this.islandsGenerator.generate(this.bodyContacts,this.bodies.length);
         this.resolveCollisions(this.islandsGenerator.contactIslands);
         this.intergateVelocities(this.dt);
         this.resolveContacts(this.islandsGenerator.contactIslands);
         this.islandsGenerator.clear();
         this.disposeBodyContacts(this.bodyContacts);
         this.integratePositions(this.dt);
         this.postPhysics();
      }
      
      private function applyForces() : void
      {
         var _loc1_:Body = null;
         var _loc2_:int = int(this.bodies.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = this.bodies[_loc3_];
            _loc1_.calcAccelerations();
            if(_loc1_.movable && !_loc1_.frozen)
            {
               _loc1_.acceleration.x += this.gravity.x;
               _loc1_.acceleration.y += this.gravity.y;
               _loc1_.acceleration.z += this.gravity.z;
            }
            _loc3_++;
         }
      }
      
      private function detectCollisions() : void
      {
         this.calculateBodiesDerivedData();
         this.collisionDetector.getBodyContacts(this.bodyContacts);
      }
      
      private function calculateBodiesDerivedData() : void
      {
         var _loc1_:Body = null;
         var _loc2_:int = int(this.bodies.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = this.bodies[_loc3_];
            if(!_loc1_.frozen)
            {
               _loc1_.saveState();
               _loc1_.calcDerivedData();
            }
            _loc3_++;
         }
      }
      
      private function prepareBodyContacts(param1:Vector.<BodyContact>, param2:Number) : void
      {
         var _loc3_:BodyContact = null;
         var _loc4_:int = int(param1.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param1[_loc5_];
            this.prepareShapeContacts(_loc3_.shapeContacts,param2);
            _loc5_++;
         }
      }
      
      private function prepareShapeContacts(param1:Vector.<ShapeContact>, param2:Number) : void
      {
         var _loc3_:ShapeContact = null;
         var _loc4_:int = int(param1.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param1[_loc5_];
            _loc3_.calculatePersistentFrameData();
            _loc3_.calcualteDynamicFrameData(this.allowedPenetration,this.penetrationErrorCorrection,this.maxCorrectablePenetration,param2);
            _loc5_++;
         }
      }
      
      private function resolveCollisions(param1:Vector.<ContactIsland>) : void
      {
         var _loc2_:ContactIsland = null;
         var _loc3_:int = int(param1.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1[_loc4_];
            _loc2_.collisionPhase(this.collisionIterations);
            _loc4_++;
         }
      }
      
      private function resolveContacts(param1:Vector.<ContactIsland>) : void
      {
         var _loc2_:ContactIsland = null;
         var _loc3_:int = int(param1.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1[_loc4_];
            _loc2_.contactPhase(this.contactIterations);
            _loc4_++;
         }
      }
      
      private function intergateVelocities(param1:Number) : void
      {
         var _loc2_:Body = null;
         var _loc3_:int = int(this.bodies.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.bodies[_loc4_];
            _loc2_.integrateVelocity(param1);
            _loc4_++;
         }
      }
      
      private function integratePositions(param1:Number) : void
      {
         var _loc2_:Body = null;
         var _loc3_:int = int(this.bodies.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.bodies[_loc4_];
            if(_loc2_.movable && !_loc2_.frozen)
            {
               _loc2_.integratePosition(param1);
               _loc2_.integratePseudoVelocity(param1);
            }
            _loc4_++;
         }
      }
      
      private function postPhysics() : void
      {
         var _loc1_:Body = null;
         var _loc2_:BodyState = null;
         var _loc3_:int = int(this.bodies.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc1_ = this.bodies[_loc4_];
            _loc1_.clearAccumulators();
            _loc1_.calcDerivedData();
            if(_loc1_.canFreeze && !_loc1_.frozen)
            {
               _loc2_ = _loc1_.state;
               if(_loc2_.velocity.length() < this.linSpeedFreezeLimit && _loc2_.angularVelocity.length() < this.angSpeedFreezeLimit)
               {
                  ++_loc1_.freezeCounter;
                  if(_loc1_.freezeCounter >= this.freezeSteps)
                  {
                     _loc1_.frozen = true;
                  }
               }
               else
               {
                  _loc1_.freezeCounter = 0;
                  _loc1_.frozen = false;
               }
            }
            _loc4_++;
         }
      }
      
      private function disposeBodyContacts(param1:Vector.<BodyContact>) : void
      {
         var _loc2_:BodyContact = null;
         var _loc3_:int = int(param1.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1[_loc4_];
            _loc2_.dispose();
            _loc4_++;
         }
         param1.length = 0;
      }
   }
}

