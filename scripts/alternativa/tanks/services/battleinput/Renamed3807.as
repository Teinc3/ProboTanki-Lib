package alternativa.tanks.services.battleinput
{
   import alternativa.tanks.utils.BitMask;
   import flash.events.EventDispatcher;
   
   public class Renamed523 extends EventDispatcher implements BattleInputService
   {
      public function Renamed523()
      {
         this.Renamed2987 = new BitMask();
         super();
      }
      
      public function lock(param1:Renamed2410) : void
      {
         var _loc2_:Boolean = this.Renamed3805();
         var _loc3_:Boolean = this.Renamed728();
         this.Renamed2987.setBits(param1.Renamed3806());
         if(!_loc2_ && this.Renamed3805())
         {
            dispatchEvent(new BattleInputLockEvent(BattleInputLockEvent.CHAT_LOCKED));
         }
         if(!_loc3_ && this.Renamed728())
         {
            dispatchEvent(new BattleInputLockEvent(BattleInputLockEvent.INPUT_LOCKED));
         }
      }
      
      public function unlock(param1:Renamed2410) : void
      {
         var _loc2_:Boolean = this.Renamed3805();
         var _loc3_:Boolean = this.Renamed728();
         this.Renamed2987.clearBits(param1.Renamed3806());
         if(_loc2_ && !this.Renamed3805())
         {
            dispatchEvent(new BattleInputLockEvent(BattleInputLockEvent.CHAT_UNLOCKED));
         }
         if(_loc3_ && !this.Renamed728())
         {
            dispatchEvent(new BattleInputLockEvent(BattleInputLockEvent.INPUT_UNLOCKED));
         }
      }
      
      public function Renamed728() : Boolean
      {
         return !this.Renamed2987.isEmpty();
      }
      
      public function Renamed3805() : Boolean
      {
         return this.Renamed2987.hasAnyBit(Renamed2410.Renamed2508.Renamed3806());
      }
   }
}

