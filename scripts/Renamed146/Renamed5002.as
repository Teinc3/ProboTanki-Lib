package Renamed4540
{
   import Renamed220.Renamed4575;
   import Renamed220.Renamed4576;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Renamed511;
   import Renamed335.Renamed4988;
   import Renamed335.Renamed4663;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class Renamed4541 extends Renamed4988 implements Renamed4663, Renamed4575, Renamed511, Renamed4576
   {
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      private const Renamed4989:int = 100;
      
      private const Renamed4990:int = 4000;
      
      private const Renamed4991:int = 5;
      
      private var Renamed2369:IGameObject;
      
      private var timer:Timer;
      
      private var Renamed4992:int;
      
      private var Renamed4993:Boolean;
      
      private var Renamed4994:Boolean;
      
      public function Renamed4541()
      {
         super();
      }
      
      public function localTankLoaded() : void
      {
         this.Renamed2369 = object;
         this.timer = new Timer(this.Renamed4989);
         this.Renamed4995();
         this.timer.start();
      }
      
      private function Renamed4996(param1:TimerEvent) : void
      {
      }
      
      private function Renamed700() : Boolean
      {
         return true;
      }
      
      private function Renamed4997() : Boolean
      {
         return true;
      }
      
      private function Renamed4998() : int
      {
         return 1;
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
      }
      
      private function Renamed4999(param1:Boolean) : void
      {
      }
      
      private function Renamed4995() : void
      {
      }
      
      private function Renamed5000() : void
      {
      }
      
      public function Renamed5001() : void
      {
      }
   }
}

