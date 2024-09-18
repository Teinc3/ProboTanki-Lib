package Renamed373
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.PhysicsScene;
   import alternativa.physics.collision.CollisionShape;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.Renamed620;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.utils.DataValidationErrorEvent;
   import alternativa.tanks.utils.DataValidatorType;
   import alternativa.tanks.utils.Vector3Validator;
   
   public class Renamed777
   {
      private static const Renamed8300:Number = 200;
      
      private var Renamed8301:Vector3Validator;
      
      private var physicsScene:PhysicsScene;
      
      private var collisionDetector:Renamed665;
      
      private var battleEventDispatcher:BattleEventDispatcher;
      
      public function Renamed777(param1:int, param2:Number, param3:BattleEventDispatcher)
      {
         super();
         this.battleEventDispatcher = param3;
         this.physicsScene = new PhysicsScene();
         this.physicsScene.gravity.reset(0,0,-param2);
         this.Renamed8301 = new Vector3Validator(this.physicsScene.gravity);
         this.physicsScene.collisionIterations = 4;
         this.physicsScene.contactIterations = 4;
         this.physicsScene.allowedPenetration = 5;
         this.collisionDetector = new Renamed665();
         this.physicsScene.collisionDetector = this.collisionDetector;
         this.physicsScene.time = param1;
      }
      
      public function Renamed653() : int
      {
         return this.physicsScene.time;
      }
      
      public function Renamed802(param1:Vector.<CollisionShape>) : void
      {
         this.collisionDetector.Renamed8273(param1);
      }
      
      public function Renamed692() : Renamed665
      {
         return this.collisionDetector;
      }
      
      public function addBody(param1:Renamed606) : void
      {
         this.physicsScene.addBody(param1.body);
         this.collisionDetector.Renamed8274(param1);
      }
      
      public function removeBody(param1:Renamed606) : void
      {
         this.physicsScene.removeBody(param1.body);
         this.collisionDetector.Renamed8275(param1);
      }
      
      public function destroy() : void
      {
         this.collisionDetector.destroy();
      }
      
      public function update(param1:int) : void
      {
         if(this.Renamed8301.isValid())
         {
            this.physicsScene.update(param1);
            this.Renamed8302();
         }
         else
         {
            this.physicsScene.time = int.MAX_VALUE;
            this.battleEventDispatcher.Renamed867(new DataValidationErrorEvent(DataValidatorType.MEMHACK_GRAVITY));
         }
      }
      
      private function Renamed8302() : void
      {
         var _loc1_:Renamed606 = null;
         var _loc2_:Body = null;
         var _loc3_:Vector3 = null;
         var _loc4_:Vector3 = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         for each(_loc1_ in this.collisionDetector.getTankBodies())
         {
            _loc2_ = _loc1_.body;
            _loc3_ = _loc2_.state.velocity;
            _loc4_ = Renamed668.Renamed669;
            _loc2_.state.orientation.getZAxis(_loc4_);
            _loc5_ = _loc3_.x * _loc4_.x + _loc3_.y * _loc4_.y + _loc3_.z * _loc4_.z;
            if(_loc4_.z < -0.1 || _loc4_.z < 0.1 && _loc5_ < 0)
            {
               _loc5_ = -_loc5_;
               _loc4_.reverse();
            }
            _loc1_.Renamed8297();
            if(_loc1_.Renamed1008 || _loc1_.Renamed8276 || _loc1_.Renamed1010() || !_loc1_.Renamed1124())
            {
               _loc6_ = Renamed8300;
               if(!_loc1_.Renamed1008 && _loc1_.Renamed1124() && _loc1_.Renamed8303 > _loc6_)
               {
                  _loc6_ = _loc1_.Renamed8303;
               }
               _loc7_ = _loc1_.Renamed1030.dot(_loc4_);
               if((_loc8_ = _loc7_ * _loc1_.body.invMass * Renamed620.Renamed782 / 1000) < Renamed8300)
               {
                  _loc8_ = 0;
               }
               _loc6_ = Math.max(_loc8_,_loc6_);
               if(_loc5_ > _loc6_)
               {
                  _loc9_ = _loc5_ - _loc6_;
                  _loc3_.x -= _loc9_ * _loc4_.x;
                  _loc3_.y -= _loc9_ * _loc4_.y;
                  _loc3_.z -= _loc9_ * _loc4_.z;
                  _loc5_ = _loc6_;
               }
            }
            _loc1_.Renamed8303 = _loc5_;
            _loc1_.Renamed1030.reset();
         }
      }
      
      public function Renamed831() : Number
      {
         return this.physicsScene.gravity.z;
      }
   }
}

