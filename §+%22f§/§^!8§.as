package §+"f§
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.CollisionDetector;
   import alternativa.tanks.battle.§+$%§;
   import alternativa.tanks.models.weapon.shared.§@"e§;
   import §extends for const§.§1Q§;
   import flash.errors.IllegalOperationError;
   import §for set super§.§super const continue§;
   
   public class §^!8§ extends §true package case§
   {
      private static const §`!W§:Vector3 = new Vector3();
      
      public function §^!8§(param1:§1Q§)
      {
         super(param1);
      }
      
      override protected function update(param1:Number) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:Body = null;
         var _loc4_:Vector3 = null;
         this.§1">§(param1);
         §`!W§.diff(§try catch extends§,§default catch§);
         var _loc5_:Number = §`!W§.length();
         §`!W§.normalize();
         var _loc6_:CollisionDetector = battleService.§'x§().§const const true§();
         if(_loc6_.raycast(§default catch§,§`!W§,§super const continue§.WEAPON,_loc5_,this,§'!G§))
         {
            _loc2_ = §+$%§.§ #T§(§'!G§.shape.body) && !§@"e§.§final var override§(§default catch§,§'!G§.position);
            §switch for use§.copy(§'!G§.position);
            if(_loc2_)
            {
               _loc3_ = §'!G§.shape.body;
            }
            else
            {
               _loc3_ = null;
               §switch for use§.subtract(§`!W§);
            }
            §dynamic const native§(_loc3_,§switch for use§,§`!W§,_loc5_);
            return;
         }
         var _loc7_:int = 0;
         while(_loc7_ < §switch var else§())
         {
            _loc4_ = §in package throw§[_loc7_];
            if(_loc6_.raycast(_loc4_,§`!W§,§super const continue§.WEAPON,_loc5_,this,§'!G§))
            {
               if(§+$%§.§ #T§(§'!G§.shape.body))
               {
                  if(!§@"e§.§final var override§(§default catch§,§'!G§.position))
                  {
                     §switch for use§.copy(§default catch§).addScaled(§'!G§.t,§`!W§);
                     §dynamic const native§(§'!G§.shape.body,§switch for use§,§`!W§,_loc5_);
                     return;
                  }
               }
            }
            _loc4_.addScaled(_loc5_,§`!W§);
            _loc7_++;
         }
         §do catch static§.updateState(§try catch extends§,§0#&§);
         this.§while catch while§(param1);
         if(this.§]p§())
         {
            this.§9!=§();
         }
      }
      
      override protected function §&-§(param1:Body, param2:Vector3, param3:Vector3, param4:Number, param5:int) : void
      {
         §do catch static§.updateState(param2,param3,param5);
      }
      
      protected function §while catch while§(param1:Number) : void
      {
         §function catch with§ += param1 * this.§9Z§();
      }
      
      protected function §9!=§() : void
      {
         destroy();
      }
      
      protected function §]p§() : Boolean
      {
         return §function catch with§ > this.§import var for§();
      }
      
      protected function §import var for§() : Number
      {
         return Number.MAX_VALUE;
      }
      
      protected function §9Z§() : Number
      {
         throw new IllegalOperationError();
      }
      
      protected function §1">§(param1:Number) : void
      {
         §default catch§.copy(§try catch extends§);
         §try catch extends§.addScaled(this.§9Z§() * param1,§0#&§);
      }
   }
}

