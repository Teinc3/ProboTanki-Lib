package alternativa.tanks.models.battle.gui.chat
{
   import alternativa.tanks.services.battleinput.BattleInputLockEvent;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class §=+§ implements AutoClosable
   {
      [Inject]
      public static var §const catch get§:BattleInputService;
      
      private var chat:§3"Q§;
      
      public function §=+§(param1:§3"Q§)
      {
         super();
         this.chat = param1;
         §const catch get§.addEventListener(BattleInputLockEvent.CHAT_LOCKED,this.§else const use§);
         §const catch get§.addEventListener(BattleInputLockEvent.CHAT_UNLOCKED,this.§try for while§);
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         §const catch get§.removeEventListener(BattleInputLockEvent.CHAT_LOCKED,this.§else const use§);
         §const catch get§.removeEventListener(BattleInputLockEvent.CHAT_UNLOCKED,this.§try for while§);
         this.chat = null;
      }
      
      private function §else const use§(param1:BattleInputLockEvent) : void
      {
         this.chat.§5!B§();
         this.chat.locked = true;
      }
      
      private function §try for while§(param1:BattleInputLockEvent) : void
      {
         this.chat.locked = false;
      }
   }
}

