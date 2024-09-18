package §`"b§
{
   import §?#>§.§ !S§;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.battle.§;!t§;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.§in for return§;
   import alternativa.tanks.battle.events.§set var native§;
   import alternativa.tanks.battle.events.§throw package continue§;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import flash.events.Event;
   import flash.utils.getTimer;
   import platform.client.fp10.core.type.AutoClosable;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class §,#[§ implements AutoClosable, §throw package continue§, §;!t§
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
      public static var §finally set§:BattleGUIService;
      
      private var §final package implements§:§ !S§;
      
      private var §null set default§:Boolean;
      
      private var §default static§:int;
      
      public function §,#[§()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         battleEventDispatcher.§set for each§(§set var native§,this);
         battleEventDispatcher.§set for each§(§in for return§,this);
         this.§final package implements§ = new § !S§(localeService.getText(TanksLocale.TEXT_REARM_PAUSE_1),localeService.getText(TanksLocale.TEXT_REARM_PAUSE_2),localeService.getText(TanksLocale.TEXT_REARM_PAUSE_3));
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         if(param1 is §set var native§)
         {
            this.§dynamic var static§();
         }
         else if(param1 is §in for return§)
         {
            this.§1Y§(§in for return§(param1));
         }
      }
      
      private function §1Y§(param1:§in for return§) : void
      {
         if(this.§null set default§)
         {
            return;
         }
         this.§null set default§ = true;
         this.§9g§();
         this.§default static§ = getTimer() + param1.§switch var false§;
         battleService.§'x§().§%#9§(this);
      }
      
      private function §9g§() : void
      {
         if(this.§final package implements§.parent == null)
         {
            §finally set§.§native const import§().addChild(this.§final package implements§);
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
         this.§final package implements§.x = display.stage.stageWidth - this.§final package implements§.width >> 1;
         this.§final package implements§.y = display.stage.stageHeight - this.§final package implements§.height >> 1;
      }
      
      private function §dynamic var static§() : void
      {
         if(!this.§null set default§)
         {
            return;
         }
         this.§null set default§ = false;
         this.§<"h§();
         battleService.§'x§().§%"7§(this);
      }
      
      private function §<"h§() : void
      {
         if(this.§final package implements§.parent != null)
         {
            this.§final package implements§.parent.removeChild(this.§final package implements§);
            display.stage.removeEventListener(Event.RESIZE,this.onStageResize);
         }
      }
      
      public function §var package implements§(param1:int, param2:int) : void
      {
         this.§final package implements§.seconds = Math.max((this.§default static§ - param1) / 1000,0);
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.§<"h§();
         battleEventDispatcher.§7!3§(§in for return§,this);
         battleEventDispatcher.§7!3§(§set var native§,this);
      }
   }
}

