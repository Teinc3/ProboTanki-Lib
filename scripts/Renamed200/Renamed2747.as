package Renamed200
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.events.Renamed869;
   import alternativa.tanks.battle.events.Renamed884;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Renamed891;
   import alternativa.tanks.battle.events.Renamed894;
   import alternativa.tanks.battle.events.Renamed511;
   import alternativa.tanks.battle.events.Renamed902;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.Renamed2407;
   import alternativa.tanks.models.tank.Renamed2408;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class Renamed2747 implements AutoClosable, Renamed511
   {
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private var Renamed2369:Tank;
      
      private var Renamed2432:Renamed902;
      
      public function Renamed2747(param1:Tank)
      {
         super();
         this.Renamed2369 = param1;
         this.Renamed2432 = new Renamed902(battleEventDispatcher,this);
         this.Renamed2432.Renamed904(Renamed884,this.Renamed2547);
         this.Renamed2432.Renamed904(Renamed891,this.Renamed2548);
         this.Renamed2432.Renamed904(Renamed869,this.Renamed5964);
         this.Renamed2432.Renamed904(Renamed894,this.Renamed2830);
         this.Renamed2432.Renamed905();
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.Renamed2432.handleBattleEvent(param1);
      }
      
      private function Renamed2547(param1:Renamed884) : void
      {
         var _loc2_:Renamed2407 = null;
         if(param1.tank == this.Renamed2369)
         {
            _loc2_ = Renamed2407(OSGi.getInstance().getService(Renamed2408));
            _loc2_.Renamed2841();
         }
      }
      
      private function Renamed2548(param1:Renamed891) : void
      {
         var _loc2_:Renamed2407 = null;
         if(param1.tank == this.Renamed2369)
         {
            _loc2_ = Renamed2407(OSGi.getInstance().getService(Renamed2408));
            _loc2_.Renamed2926();
         }
      }
      
      private function Renamed5964(param1:Renamed869) : void
      {
         var _loc2_:Renamed2407 = Renamed2407(OSGi.getInstance().getService(Renamed2408));
         _loc2_.Renamed2915(param1.Renamed873);
      }
      
      private function Renamed2830(param1:Object) : void
      {
         var _loc2_:Renamed2407 = Renamed2407(OSGi.getInstance().getService(Renamed2408));
         _loc2_.Renamed2926();
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.Renamed2432.Renamed906();
         this.Renamed2432 = null;
         this.Renamed2369 = null;
      }
   }
}

