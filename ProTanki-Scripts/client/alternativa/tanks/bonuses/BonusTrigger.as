package alternativa.tanks.bonuses
{
   import alternativa.math.Matrix3;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.PhysicsMaterial;
   import alternativa.physics.collision.CollisionShape;
   import alternativa.physics.collision.primitives.CollisionBox;
   import alternativa.tanks.battle.Renamed804;
   import alternativa.tanks.battle.Renamed832;
   import Renamed373.Renamed666;
   
   public class BonusTrigger extends Renamed832 implements Renamed804
   {
      private var bonus:BattleBonus;
      
      private var collisionBox:CollisionBox;
      
      public function BonusTrigger(param1:BattleBonus)
      {
         super();
         this.bonus = param1;
         var _loc2_:Number = BonusConst.BONUS_HALF_SIZE;
         this.collisionBox = new CollisionBox(new Vector3(_loc2_,_loc2_,_loc2_),Renamed666.Renamed1449,PhysicsMaterial.DEFAULT_MATERIAL);
      }
      
      public function enable() : void
      {
         Renamed619().Renamed803(this);
      }
      
      public function disable() : void
      {
         Renamed619().Renamed805(this);
      }
      
      public function update(param1:Matrix4) : void
      {
         var _loc2_:Matrix4 = this.collisionBox.transform;
         _loc2_.copy(param1);
         this.collisionBox.calculateAABB();
      }
      
      public function updateByComponents(param1:Number, param2:Number, param3:Number, param4:Number, param5:int, param6:Number) : void
      {
         var _loc7_:Matrix4 = this.collisionBox.transform;
         _loc7_.setMatrix(param1,param2,param3,param4,param5,param6);
         this.collisionBox.calculateAABB();
      }
      
      public function setTransform(param1:Vector3, param2:Matrix3) : void
      {
         var _loc3_:Matrix4 = this.collisionBox.transform;
         _loc3_.setFromMatrix3(param2,param1);
         this.collisionBox.calculateAABB();
      }
      
      public function checkTrigger(param1:Body) : void
      {
         var _loc2_:CollisionShape = null;
         var _loc3_:int = 0;
         while(_loc3_ < param1.numCollisionShapes)
         {
            _loc2_ = param1.collisionShapes[_loc3_];
            if(Renamed619().Renamed692().testCollision(_loc2_,this.collisionBox))
            {
               this.bonus.onTriggerActivated();
               return;
            }
            _loc3_++;
         }
      }
   }
}

