package §for set super§
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.PhysicsScene;
   import alternativa.physics.collision.CollisionShape;
   import alternativa.tanks.battle.§+$%§;
   import alternativa.tanks.battle.§class true§;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.utils.DataValidationErrorEvent;
   import alternativa.tanks.utils.DataValidatorType;
   import alternativa.tanks.utils.Vector3Validator;
   
   public class §6"4§
   {
      private static const §finally for case§:Number = 200;
      
      private var §package for function§:Vector3Validator;
      
      private var physicsScene:PhysicsScene;
      
      private var collisionDetector:§!"N§;
      
      private var battleEventDispatcher:BattleEventDispatcher;
      
      public function §6"4§(param1:int, param2:Number, param3:BattleEventDispatcher)
      {
         super();
         this.battleEventDispatcher = param3;
         this.physicsScene = new PhysicsScene();
         this.physicsScene.gravity.reset(0,0,-param2);
         this.§package for function§ = new Vector3Validator(this.physicsScene.gravity);
         this.physicsScene.collisionIterations = 4;
         this.physicsScene.contactIterations = 4;
         this.physicsScene.allowedPenetration = 5;
         this.collisionDetector = new §!"N§();
         this.physicsScene.collisionDetector = this.collisionDetector;
         this.physicsScene.time = param1;
      }
      
      public function §]"d§() : int
      {
         return this.physicsScene.time;
      }
      
      public function §do set implements§(param1:Vector.<CollisionShape>) : void
      {
         this.collisionDetector.§9;§(param1);
      }
      
      public function §const const true§() : §!"N§
      {
         return this.collisionDetector;
      }
      
      public function addBody(param1:§=-§) : void
      {
         this.physicsScene.addBody(param1.body);
         this.collisionDetector.§in const super§(param1);
      }
      
      public function removeBody(param1:§=-§) : void
      {
         this.physicsScene.removeBody(param1.body);
         this.collisionDetector.§continue set class§(param1);
      }
      
      public function destroy() : void
      {
         this.collisionDetector.destroy();
      }
      
      public function update(param1:int) : void
      {
         if(this.§package for function§.isValid())
         {
            this.physicsScene.update(param1);
            this.§catch package return§();
         }
         else
         {
            this.physicsScene.time = int.MAX_VALUE;
            this.battleEventDispatcher.§"#L§(new DataValidationErrorEvent(DataValidatorType.MEMHACK_GRAVITY));
         }
      }
      
      private function §catch package return§() : void
      {
         var _loc1_:§=-§ = null;
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
            _loc4_ = §+$%§.§@!c§;
            _loc2_.state.orientation.getZAxis(_loc4_);
            _loc5_ = _loc3_.x * _loc4_.x + _loc3_.y * _loc4_.y + _loc3_.z * _loc4_.z;
            if(_loc4_.z < -0.1 || _loc4_.z < 0.1 && _loc5_ < 0)
            {
               _loc5_ = -_loc5_;
               _loc4_.reverse();
            }
            _loc1_.§"#2§();
            if(_loc1_.§set extends§ || _loc1_.§[%§ || _loc1_.§switch package import§() || !_loc1_.§&#Q§())
            {
               _loc6_ = §finally for case§;
               if(!_loc1_.§set extends§ && _loc1_.§&#Q§() && _loc1_.§true set native§ > _loc6_)
               {
                  _loc6_ = _loc1_.§true set native§;
               }
               _loc7_ = _loc1_.§use const set§.dot(_loc4_);
               if((_loc8_ = _loc7_ * _loc1_.body.invMass * §class true§.§@"r§ / 1000) < §finally for case§)
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
            _loc1_.§true set native§ = _loc5_;
            _loc1_.§use const set§.reset();
         }
      }
      
      public function §16§() : Number
      {
         return this.physicsScene.gravity.z;
      }
   }
}

