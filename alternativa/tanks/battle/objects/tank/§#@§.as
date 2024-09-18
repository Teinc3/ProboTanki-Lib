package alternativa.tanks.battle.objects.tank
{
   import alternativa.physics.collision.CollisionShape;
   import alternativa.physics.collision.primitives.CollisionBox;
   import alternativa.tanks.utils.DataUnitValidator;
   import alternativa.tanks.utils.DataValidatorType;
   import alternativa.tanks.utils.EncryptedCollisionBoxData;
   
   public class §#@§ implements DataUnitValidator
   {
      private var §default for super§:Vector.<EncryptedCollisionBoxData>;
      
      public function §#@§(param1:Vector.<CollisionShape>)
      {
         super();
         this.§default for super§ = new Vector.<EncryptedCollisionBoxData>(param1.length);
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            this.§default for super§[_loc2_] = new EncryptedCollisionBoxData(CollisionBox(param1[_loc2_]));
            _loc2_++;
         }
      }
      
      public function hasIncorrectData() : Boolean
      {
         var _loc1_:EncryptedCollisionBoxData = null;
         for each(_loc1_ in this.§default for super§)
         {
            if(_loc1_.isInvalid())
            {
               return true;
            }
         }
         return false;
      }
      
      public function getType() : int
      {
         return DataValidatorType.TANK;
      }
      
      public function destroy() : void
      {
         this.§default for super§.length = 0;
      }
   }
}

