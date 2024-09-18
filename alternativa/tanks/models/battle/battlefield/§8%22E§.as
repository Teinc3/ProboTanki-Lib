package alternativa.tanks.models.battle.battlefield
{
   import alternativa.tanks.services.battleinput.BattleInputLockEvent;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import §class var for§.§const set default§;
   
   public class §8"E§
   {
      [Inject]
      public static var §const catch get§:BattleInputService;
      
      private var §native catch switch§:§const set default§;
      
      public function §8"E§(param1:§const set default§)
      {
         super();
         this.§native catch switch§ = param1;
         §const catch get§.addEventListener(BattleInputLockEvent.INPUT_LOCKED,this.§@#%§);
         §const catch get§.addEventListener(BattleInputLockEvent.INPUT_UNLOCKED,this.§null package import§);
         if(§const catch get§.§false set true§())
         {
            param1.§finally catch static§();
         }
      }
      
      private function §@#%§(param1:BattleInputLockEvent) : void
      {
         this.§native catch switch§.§finally catch static§();
      }
      
      private function §null package import§(param1:BattleInputLockEvent) : void
      {
         this.§native catch switch§.§null for return§();
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.§native catch switch§ = null;
         §const catch get§.removeEventListener(BattleInputLockEvent.INPUT_LOCKED,this.§@#%§);
         §const catch get§.removeEventListener(BattleInputLockEvent.INPUT_UNLOCKED,this.§null package import§);
      }
   }
}

