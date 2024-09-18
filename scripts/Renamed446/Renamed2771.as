package Renamed446
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.Renamed768;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.events.Renamed883;
   import alternativa.tanks.battle.events.Renamed884;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Renamed894;
   import alternativa.tanks.battle.events.Renamed511;
   import alternativa.tanks.battle.events.Renamed902;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.Renamed2407;
   import alternativa.tanks.models.tank.Renamed2408;
   import alternativa.tanks.utils.MathUtils;
   
   public class Renamed2771 implements Renamed768, Renamed511
   {
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var battleService:BattleService;
      
      private var Renamed8979:int;
      
      private var tank:Tank;
      
      private var Renamed2432:Renamed902;
      
      public function Renamed2771(param1:int, param2:Tank)
      {
         super();
         this.Renamed8979 = param1;
         this.tank = param2;
         this.Renamed8980(battleEventDispatcher);
      }
      
      private function Renamed8980(param1:BattleEventDispatcher) : void
      {
         this.Renamed2432 = new Renamed902(param1,this);
         this.Renamed2432.Renamed904(Renamed884,this.Renamed2547);
         this.Renamed2432.Renamed904(Renamed883,this.Renamed3157);
         this.Renamed2432.Renamed904(Renamed894,this.Renamed8981);
         this.Renamed2432.Renamed905();
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.Renamed2432.handleBattleEvent(param1);
      }
      
      public function Renamed769(param1:int, param2:int) : void
      {
         this.tank.Renamed1075().setAlpha(MathUtils.clamp((this.Renamed8979 - param1) / 500,0,1));
         if(param1 > this.Renamed8979)
         {
            this.stop();
            Renamed2407(OSGi.getInstance().getService(Renamed2408)).readyToSpawn(this.tank);
         }
      }
      
      private function Renamed3157(param1:Renamed883) : void
      {
         if(param1.tank == this.tank)
         {
            this.stop();
         }
      }
      
      private function Renamed2547(param1:Renamed884) : void
      {
         if(param1.tank == this.tank)
         {
            this.stop();
         }
      }
      
      private function Renamed8981(param1:Renamed894) : void
      {
         this.stop();
      }
      
      private function stop() : void
      {
         battleService.Renamed619().Renamed816(this);
         this.Renamed2432.Renamed906();
      }
   }
}

