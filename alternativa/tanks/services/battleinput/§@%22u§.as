package alternativa.tanks.services.battleinput
{
   import alternativa.tanks.utils.BitMask;
   import flash.events.EventDispatcher;
   
   public class §@"u§ extends EventDispatcher implements BattleInputService
   {
      public function §@"u§()
      {
         this.§get static§ = new BitMask();
         super();
      }
      
      public function lock(param1:§class const while§) : void
      {
         var _loc2_:Boolean = this.§false override§();
         var _loc3_:Boolean = this.§false set true§();
         this.§get static§.setBits(param1.§+"g§());
         if(!_loc2_ && this.§false override§())
         {
            dispatchEvent(new BattleInputLockEvent(BattleInputLockEvent.CHAT_LOCKED));
         }
         if(!_loc3_ && this.§false set true§())
         {
            dispatchEvent(new BattleInputLockEvent(BattleInputLockEvent.INPUT_LOCKED));
         }
      }
      
      public function unlock(param1:§class const while§) : void
      {
         var _loc2_:Boolean = this.§false override§();
         var _loc3_:Boolean = this.§false set true§();
         this.§get static§.clearBits(param1.§+"g§());
         if(_loc2_ && !this.§false override§())
         {
            dispatchEvent(new BattleInputLockEvent(BattleInputLockEvent.CHAT_UNLOCKED));
         }
         if(_loc3_ && !this.§false set true§())
         {
            dispatchEvent(new BattleInputLockEvent(BattleInputLockEvent.INPUT_UNLOCKED));
         }
      }
      
      public function §false set true§() : Boolean
      {
         return !this.§get static§.isEmpty();
      }
      
      public function §false override§() : Boolean
      {
         return this.§get static§.hasAnyBit(§class const while§.§7!d§.§+"g§());
      }
   }
}

