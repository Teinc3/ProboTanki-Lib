package alternativa.tanks.models.battle.battlefield
{
   import alternativa.tanks.battle.events.Renamed884;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Renamed891;
   import alternativa.tanks.battle.events.Renamed511;
   import alternativa.tanks.battle.events.Renamed902;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.Renamed864;
   import alternativa.tanks.services.spectatorservice.SpectatorService;
   import alternativa.utils.clearDictionary;
   import flash.utils.Dictionary;
   
   public class Renamed2453 implements Renamed864, Renamed511
   {
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var Renamed2545:SpectatorService;
      
      private var Renamed2432:Renamed902;
      
      public function Renamed2453()
      {
         this.Renamed2546 = new Dictionary();
         super();
         this.Renamed2432 = new Renamed902(battleEventDispatcher,this);
         this.Renamed2432.Renamed904(Renamed884,this.Renamed2547);
         this.Renamed2432.Renamed904(Renamed891,this.Renamed2548);
         this.Renamed2432.Renamed905();
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.Renamed2432.handleBattleEvent(param1);
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.Renamed2432.Renamed906();
         clearDictionary(this.Renamed2546);
      }
      
      private function Renamed2547(param1:Renamed884) : void
      {
         this.Renamed2546[param1.tank] = true;
      }
      
      private function Renamed2548(param1:Renamed891) : void
      {
         delete this.Renamed2546[param1.tank];
      }
      
      public function Renamed865() : void
      {
         var _loc1_:* = undefined;
         for(_loc1_ in this.Renamed2546)
         {
            this.Renamed2549(_loc1_);
         }
      }
      
      private function Renamed2549(param1:Tank) : void
      {
         if(param1.tankData.health > 0 && Renamed2545.Renamed2550())
         {
            param1.Renamed1076();
         }
         else
         {
            param1.Renamed1077();
         }
      }
   }
}

