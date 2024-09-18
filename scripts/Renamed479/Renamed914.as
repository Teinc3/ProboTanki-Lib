package Renamed479
{
   import Renamed4543.Renamed4544;
   import Renamed4543.Renamed4545;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.events.Renamed887;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Renamed511;
   import alternativa.tanks.battle.scene3d.Renamed919;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import alternativa.tanks.services.targeting.TargetingModeService;
   import flash.events.Event;
   
   public class Renamed914 implements Renamed511, Renamed919
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var Renamed2384:BattleInputService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var Renamed4733:TargetingModeService;
      
      private var Renamed5261:Boolean = false;
      
      private var Renamed9435:Boolean = false;
      
      private var Renamed9436:Renamed4545;
      
      private var mouseState:Renamed4544;
      
      private var currentState:Renamed5258 = null;
      
      private var Renamed9437:Renamed5258 = null;
      
      private var Renamed991:Renamed915;
      
      private var Renamed9438:Boolean;
      
      public function Renamed914(param1:Renamed915)
      {
         super();
         this.Renamed991 = param1;
         display.stage.addEventListener(Event.DEACTIVATE,this.Renamed3405);
         battleEventDispatcher.Renamed539(Renamed887,this);
         this.Renamed9436 = new Renamed4545(param1);
         this.mouseState = this.Renamed9439(param1);
         this.changeState(this.Renamed9433(Renamed4733.Renamed1024()));
         battleService.Renamed621().Renamed1287(this);
      }
      
      protected function Renamed9439(param1:Renamed915) : Renamed4544
      {
         return new Renamed4544(param1);
      }
      
      public function render(param1:int, param2:int) : void
      {
         this.tick(param2 * 0.001);
      }
      
      public function tick(param1:Number) : void
      {
         if(this.Renamed9437 != null)
         {
            if(this.currentState != null)
            {
               this.currentState.exit();
            }
            this.Renamed991.Renamed5266();
            this.currentState = this.Renamed9437;
            this.currentState.enter();
            this.Renamed9437 = null;
         }
         if(this.currentState != null)
         {
            if(this.Renamed9438)
            {
               this.currentState.exit();
               this.currentState.enter();
               this.Renamed9438 = false;
            }
            this.currentState.tick(param1);
         }
      }
      
      private function Renamed3405(param1:Event) : void
      {
         this.Renamed5261 = false;
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         display.stage.removeEventListener(Event.DEACTIVATE,this.Renamed3405);
         battleEventDispatcher.Renamed866(Renamed887,this);
         battleService.Renamed621().Renamed1289(this);
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Renamed887 = param1 as Renamed887;
         if(_loc3_ != null)
         {
            _loc2_ = _loc3_.targetingMode;
            this.changeState(this.Renamed9433(_loc2_));
         }
      }
      
      protected function changeState(param1:Renamed5258) : void
      {
         this.Renamed9437 = param1;
      }
      
      protected function Renamed9433(param1:int) : Renamed5258
      {
         switch(param1)
         {
            case Renamed912.Renamed1025:
               return this.Renamed9436;
            case Renamed912.Renamed1026:
               return this.mouseState;
            default:
               return null;
         }
      }
      
      public function Renamed1062() : Renamed915
      {
         return this.Renamed991;
      }
      
      public function Renamed9434() : void
      {
         this.Renamed991.Renamed5265();
         this.Renamed991.Renamed2848(0);
      }
      
      public function reset() : void
      {
         this.Renamed9434();
         this.Renamed9438 = true;
      }
   }
}

