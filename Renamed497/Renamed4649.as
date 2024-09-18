package Renamed2615
{
   import Renamed4626.Renamed5681;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.battle.Renamed768;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Renamed897;
   import alternativa.tanks.battle.events.Renamed900;
   import alternativa.tanks.battle.events.Renamed511;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import flash.events.Event;
   import flash.utils.getTimer;
   import platform.client.fp10.core.type.AutoClosable;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class Renamed4649 implements AutoClosable, Renamed511, Renamed768
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var Renamed4729:BattleGUIService;
      
      private var Renamed9674:Renamed5681;
      
      private var Renamed9675:Boolean;
      
      private var Renamed9676:int;
      
      public function Renamed4649()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         battleEventDispatcher.Renamed539(Renamed900,this);
         battleEventDispatcher.Renamed539(Renamed897,this);
         this.Renamed9674 = new Renamed5681(localeService.getText(TanksLocale.TEXT_REARM_PAUSE_1),localeService.getText(TanksLocale.TEXT_REARM_PAUSE_2),localeService.getText(TanksLocale.TEXT_REARM_PAUSE_3));
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         if(param1 is Renamed900)
         {
            this.Renamed5913();
         }
         else if(param1 is Renamed897)
         {
            this.Renamed9677(Renamed897(param1));
         }
      }
      
      private function Renamed9677(param1:Renamed897) : void
      {
         if(this.Renamed9675)
         {
            return;
         }
         this.Renamed9675 = true;
         this.Renamed9678();
         this.Renamed9676 = getTimer() + param1.Renamed875;
         battleService.Renamed619().Renamed815(this);
      }
      
      private function Renamed9678() : void
      {
         if(this.Renamed9674.parent == null)
         {
            Renamed4729.Renamed2492().addChild(this.Renamed9674);
            display.stage.addEventListener(Event.RESIZE,this.onStageResize);
            this.setPosition();
         }
      }
      
      private function onStageResize(param1:Event) : void
      {
         this.setPosition();
      }
      
      private function setPosition() : void
      {
         this.Renamed9674.x = display.stage.stageWidth - this.Renamed9674.width >> 1;
         this.Renamed9674.y = display.stage.stageHeight - this.Renamed9674.height >> 1;
      }
      
      private function Renamed5913() : void
      {
         if(!this.Renamed9675)
         {
            return;
         }
         this.Renamed9675 = false;
         this.Renamed9679();
         battleService.Renamed619().Renamed816(this);
      }
      
      private function Renamed9679() : void
      {
         if(this.Renamed9674.parent != null)
         {
            this.Renamed9674.parent.removeChild(this.Renamed9674);
            display.stage.removeEventListener(Event.RESIZE,this.onStageResize);
         }
      }
      
      public function Renamed769(param1:int, param2:int) : void
      {
         this.Renamed9674.seconds = Math.max((this.Renamed9676 - param1) / 1000,0);
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.Renamed9679();
         battleEventDispatcher.Renamed866(Renamed897,this);
         battleEventDispatcher.Renamed866(Renamed900,this);
      }
   }
}

