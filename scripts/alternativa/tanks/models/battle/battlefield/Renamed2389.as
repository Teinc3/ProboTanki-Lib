package alternativa.tanks.models.battle.battlefield
{
   import alternativa.tanks.services.battleinput.BattleInputLockEvent;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import Renamed333.Renamed2382;
   
   public class Renamed2383
   {
      [Inject]
      public static var Renamed2384:BattleInputService;
      
      private var Renamed1358:Renamed2382;
      
      public function Renamed2383(param1:Renamed2382)
      {
         super();
         this.Renamed1358 = param1;
         Renamed2384.addEventListener(BattleInputLockEvent.INPUT_LOCKED,this.Renamed2385);
         Renamed2384.addEventListener(BattleInputLockEvent.INPUT_UNLOCKED,this.Renamed2386);
         if(Renamed2384.Renamed728())
         {
            param1.Renamed2387();
         }
      }
      
      private function Renamed2385(param1:BattleInputLockEvent) : void
      {
         this.Renamed1358.Renamed2387();
      }
      
      private function Renamed2386(param1:BattleInputLockEvent) : void
      {
         this.Renamed1358.Renamed2388();
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.Renamed1358 = null;
         Renamed2384.removeEventListener(BattleInputLockEvent.INPUT_LOCKED,this.Renamed2385);
         Renamed2384.removeEventListener(BattleInputLockEvent.INPUT_UNLOCKED,this.Renamed2386);
      }
   }
}

