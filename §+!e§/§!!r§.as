package §+!e§
{
   import §?#>§.§,$$§;
   import alternativa.object.ClientObject;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.§;!t§;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.events.§+#k§;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.§const var finally§;
   import alternativa.tanks.battle.events.§throw package continue§;
   import §class catch import§.§use var var§;
   import §false for true§.§"P§;
   import §false for true§.§extends§;
   import §false for true§.§native while§;
   import flash.events.Event;
   import flash.utils.getTimer;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class §!!r§ implements AutoClosable, §throw package continue§, §;!t§
   {
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var battleService:BattleService;
      
      private static const §use package catch§:int = 900;
      
      private var _user:ClientObject;
      
      private var §,"1§:int;
      
      private var §1#6§:§,$$§;
      
      public function §!!r§(param1:ClientObject)
      {
         super();
         this._user = param1;
         this.init();
      }
      
      private function init() : void
      {
         this.§1#6§ = new §,$$§();
         display.stage.addEventListener(Event.ACTIVATE,this.§>"o§);
         display.stage.addEventListener(Event.DEACTIVATE,this.§2"o§);
         battleEventDispatcher.§set for each§(§"P§,this);
         battleEventDispatcher.§set for each§(§const var finally§,this);
         battleEventDispatcher.§set for each§(§+#k§,this);
         battleEventDispatcher.§set for each§(§use var var§,this);
      }
      
      private function §>"o§(param1:Event) : void
      {
         this.§1#6§.visible = true;
      }
      
      private function §2"o§(param1:Event) : void
      {
         this.§1#6§.visible = false;
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         if(param1 is §"P§)
         {
            this.showIndicator(§"P§(param1).suicideDelayMS + §use package catch§);
         }
         else if(param1 is §const var finally§)
         {
            this.hideIndicator();
         }
         else if(param1 is §+#k§)
         {
            this.§%#`§(§+#k§(param1));
         }
         else if(param1 is §use var var§)
         {
            this.§0!0§(§use var var§(param1));
         }
      }
      
      private function showIndicator(param1:int) : void
      {
         this.§,"1§ = getTimer() + param1;
         this.§1#6§.show(param1 / 1000);
         battleService.§'x§().§%#9§(this);
         battleEventDispatcher.dispatchEvent(new §native while§());
      }
      
      private function hideIndicator() : void
      {
         battleService.§'x§().§%"7§(this);
         this.§1#6§.hide();
         battleEventDispatcher.dispatchEvent(new §extends§());
      }
      
      public function §var package implements§(param1:int, param2:int) : void
      {
         this.§1#6§.seconds = Math.max((this.§,"1§ - param1) / 1000,0);
      }
      
      private function §%#`§(param1:§+#k§) : void
      {
         if(this._user == param1.tank.§if for with§())
         {
            this.hideIndicator();
         }
      }
      
      private function §0!0§(param1:§use var var§) : void
      {
         if(this._user == param1.§%#w§.§if for with§())
         {
            this.hideIndicator();
         }
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         display.stage.removeEventListener(Event.ACTIVATE,this.§>"o§);
         display.stage.removeEventListener(Event.DEACTIVATE,this.§2"o§);
         battleEventDispatcher.§7!3§(§"P§,this);
         battleEventDispatcher.§7!3§(§const var finally§,this);
         battleEventDispatcher.§7!3§(§+#k§,this);
         battleEventDispatcher.§7!3§(§use var var§,this);
         this.§1#6§.destroy();
         this.§1#6§ = null;
         this._user = null;
      }
   }
}

