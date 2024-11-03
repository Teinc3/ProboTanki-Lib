package Renamed200
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.objects.tank.Renamed1140;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.Renamed2407;
   import alternativa.tanks.models.tank.Renamed2408;
   import alternativa.tanks.services.battleinput.BattleInputLockEvent;
   import alternativa.tanks.services.battleinput.BattleInputService;
   
   public class Renamed2751
   {
      [Inject]
      public static var Renamed718:BattleInputService;
      
      private var user:Tank;
      
      public function Renamed2751(param1:Tank)
      {
         super();
         this.user = param1;
         Renamed718.addEventListener(BattleInputLockEvent.INPUT_LOCKED,this.Renamed2385);
         Renamed718.addEventListener(BattleInputLockEvent.INPUT_UNLOCKED,this.Renamed2386);
      }
      
      private function Renamed2385(param1:BattleInputLockEvent) : void
      {
         var _loc2_:Renamed2407 = Renamed2407(OSGi.getInstance().getService(Renamed2408));
         _loc2_.Renamed2886(this.user.Renamed695(),Renamed1140.INPUT);
         _loc2_.Renamed2898(this.user.Renamed695()).Renamed2713(Renamed1140.INPUT,true);
      }
      
      private function Renamed2386(param1:BattleInputLockEvent) : void
      {
         var _loc2_:Renamed2407 = Renamed2407(OSGi.getInstance().getService(Renamed2408));
         _loc2_.Renamed2887(this.user.Renamed695(),Renamed1140.INPUT);
         _loc2_.Renamed2898(this.user.Renamed695()).Renamed2714(Renamed1140.INPUT);
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         Renamed718.removeEventListener(BattleInputLockEvent.INPUT_LOCKED,this.Renamed2385);
         Renamed718.removeEventListener(BattleInputLockEvent.INPUT_UNLOCKED,this.Renamed2386);
         this.user = null;
      }
   }
}

