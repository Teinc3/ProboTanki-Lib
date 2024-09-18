package Renamed357
{
   import Renamed148.Renamed3021;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.events.Renamed874;
   import alternativa.tanks.battle.events.Renamed884;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Renamed900;
   import alternativa.tanks.battle.events.Renamed511;
   import alternativa.tanks.battle.events.Renamed902;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.Renamed2407;
   import alternativa.tanks.models.tank.Renamed775;
   import alternativa.tanks.models.tank.Renamed2408;
   
   public class Renamed2763 implements Renamed2764, Renamed511
   {
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private var Renamed2369:Tank;
      
      private var server:Renamed3021;
      
      private var Renamed2432:Renamed902;
      
      private var Renamed8146:Boolean;
      
      private var Renamed8147:Boolean;
      
      public function Renamed2763(param1:Tank, param2:Renamed3021)
      {
         super();
         this.Renamed2369 = param1;
         this.server = param2;
         this.Renamed2432 = new Renamed902(battleEventDispatcher,this);
         this.Renamed2432.Renamed904(Renamed874,this.Renamed5912);
         this.Renamed2432.Renamed904(Renamed900,this.Renamed5913);
         this.Renamed2432.Renamed904(Renamed884,this.Renamed2547);
         this.Renamed2432.Renamed905();
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.Renamed2432.handleBattleEvent(param1);
      }
      
      private function Renamed5912(param1:Object) : void
      {
         this.Renamed8146 = true;
      }
      
      private function Renamed5913(param1:Object) : void
      {
         this.Renamed8146 = false;
         if(this.Renamed8147)
         {
            this.Renamed8148();
         }
      }
      
      private function Renamed2547(param1:Renamed884) : void
      {
         if(param1.tank == this.Renamed2369)
         {
            this.Renamed8147 = false;
         }
      }
      
      public function handleReadyToSpawn() : void
      {
         var _loc1_:Renamed2407 = Renamed2407(OSGi.getInstance().getService(Renamed2408));
         _loc1_.Renamed2861(Renamed775.Renamed824.tank);
         if(this.Renamed8146)
         {
            this.Renamed8147 = true;
         }
         else
         {
            this.Renamed8148();
         }
      }
      
      private function Renamed8148() : void
      {
         this.Renamed8147 = false;
         this.server.Renamed3023();
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.Renamed2369 = null;
         this.server = null;
         this.Renamed2432.Renamed906();
         this.Renamed2432 = null;
      }
   }
}

