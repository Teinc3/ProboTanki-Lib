package §+!e§
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.objects.tank.§<"]§;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.§2!s§;
   import alternativa.tanks.models.tank.§finally var return§;
   import alternativa.tanks.services.battleinput.BattleInputLockEvent;
   import alternativa.tanks.services.battleinput.BattleInputService;
   
   public class §do for switch§
   {
      [Inject]
      public static var §^"<§:BattleInputService;
      
      private var user:Tank;
      
      public function §do for switch§(param1:Tank)
      {
         super();
         this.user = param1;
         §^"<§.addEventListener(BattleInputLockEvent.INPUT_LOCKED,this.§@#%§);
         §^"<§.addEventListener(BattleInputLockEvent.INPUT_UNLOCKED,this.§null package import§);
      }
      
      private function §@#%§(param1:BattleInputLockEvent) : void
      {
         var _loc2_:§2!s§ = §2!s§(OSGi.getInstance().getService(§finally var return§));
         _loc2_.§else var try§(this.user.§if for with§(),§<"]§.INPUT);
         _loc2_.§set set super§(this.user.§if for with§()).§-!e§(§<"]§.INPUT,true);
      }
      
      private function §null package import§(param1:BattleInputLockEvent) : void
      {
         var _loc2_:§2!s§ = §2!s§(OSGi.getInstance().getService(§finally var return§));
         _loc2_.§["W§(this.user.§if for with§(),§<"]§.INPUT);
         _loc2_.§set set super§(this.user.§if for with§()).§9!-§(§<"]§.INPUT);
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         §^"<§.removeEventListener(BattleInputLockEvent.INPUT_LOCKED,this.§@#%§);
         §^"<§.removeEventListener(BattleInputLockEvent.INPUT_UNLOCKED,this.§null package import§);
         this.user = null;
      }
   }
}

