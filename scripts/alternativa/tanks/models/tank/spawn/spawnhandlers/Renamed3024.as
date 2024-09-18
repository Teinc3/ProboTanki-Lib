package alternativa.tanks.models.tank.spawn.spawnhandlers
{
   import Renamed148.Renamed3021;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Renamed892;
   import alternativa.tanks.battle.events.Renamed511;
   import alternativa.tanks.services.battlereadiness.BattleReadinessService;
   import platform.client.fp10.core.type.AutoClosable;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed2758 implements AutoClosable, Renamed511
   {
      [Inject]
      public static var Renamed2422:BattleReadinessService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private var user:IGameObject;
      
      private var server:Renamed3021;
      
      public function Renamed2758(param1:IGameObject, param2:Renamed3021)
      {
         super();
         this.user = param1;
         this.server = param2;
         if(Renamed2422.Renamed3022())
         {
            this.spawn();
         }
         else
         {
            battleEventDispatcher.Renamed539(Renamed892,this);
         }
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.spawn();
      }
      
      private function spawn() : void
      {
         this.server.Renamed3023();
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.user = null;
         this.server = null;
         battleEventDispatcher.Renamed866(Renamed892,this);
      }
   }
}

