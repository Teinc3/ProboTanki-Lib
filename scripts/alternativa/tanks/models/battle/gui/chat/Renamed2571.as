package alternativa.tanks.models.battle.gui.chat
{
   import alternativa.tanks.services.battleinput.BattleInputLockEvent;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class Renamed2571 implements AutoClosable
   {
      [Inject]
      public static var Renamed2384:BattleInputService;
      
      private var chat:Renamed2568;
      
      public function Renamed2571(param1:Renamed2568)
      {
         super();
         this.chat = param1;
         Renamed2384.addEventListener(BattleInputLockEvent.CHAT_LOCKED,this.Renamed2645);
         Renamed2384.addEventListener(BattleInputLockEvent.CHAT_UNLOCKED,this.Renamed2646);
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         Renamed2384.removeEventListener(BattleInputLockEvent.CHAT_LOCKED,this.Renamed2645);
         Renamed2384.removeEventListener(BattleInputLockEvent.CHAT_UNLOCKED,this.Renamed2646);
         this.chat = null;
      }
      
      private function Renamed2645(param1:BattleInputLockEvent) : void
      {
         this.chat.Renamed2635();
         this.chat.locked = true;
      }
      
      private function Renamed2646(param1:BattleInputLockEvent) : void
      {
         this.chat.locked = false;
      }
   }
}

