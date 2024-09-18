package §]#R§
{
   import §""W§.§ #"§;
   import §""W§.§0"v§;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.events.§9"A§;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.§throw package continue§;
   import alternativa.tanks.battle.scene3d.§else if§;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import alternativa.tanks.services.targeting.TargetingModeService;
   import flash.events.Event;
   
   public class §switch var implements§ implements §throw package continue§, §else if§
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var §const catch get§:BattleInputService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var §<"J§:TargetingModeService;
      
      private var §class var const§:Boolean = false;
      
      private var §native catch set§:Boolean = false;
      
      private var §if package§:§0"v§;
      
      private var mouseState:§ #"§;
      
      private var currentState:§if set case§ = null;
      
      private var §null set switch§:§if set case§ = null;
      
      private var §finally for var§:§try set for§;
      
      private var §each set case§:Boolean;
      
      public function §switch var implements§(param1:§try set for§)
      {
         super();
         this.§finally for var§ = param1;
         display.stage.addEventListener(Event.DEACTIVATE,this.§else set class§);
         battleEventDispatcher.§set for each§(§9"A§,this);
         this.§if package§ = new §0"v§(param1);
         this.mouseState = this.§do package if§(param1);
         this.changeState(this.§?";§(§<"J§.§;"W§()));
         battleService.§3l§().§9"N§(this);
      }
      
      protected function §do package if§(param1:§try set for§) : § #"§
      {
         return new § #"§(param1);
      }
      
      public function render(param1:int, param2:int) : void
      {
         this.tick(param2 * 0.001);
      }
      
      public function tick(param1:Number) : void
      {
         if(this.§null set switch§ != null)
         {
            if(this.currentState != null)
            {
               this.currentState.exit();
            }
            this.§finally for var§.§get set false§();
            this.currentState = this.§null set switch§;
            this.currentState.enter();
            this.§null set switch§ = null;
         }
         if(this.currentState != null)
         {
            if(this.§each set case§)
            {
               this.currentState.exit();
               this.currentState.enter();
               this.§each set case§ = false;
            }
            this.currentState.tick(param1);
         }
      }
      
      private function §else set class§(param1:Event) : void
      {
         this.§class var const§ = false;
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         display.stage.removeEventListener(Event.DEACTIVATE,this.§else set class§);
         battleEventDispatcher.§7!3§(§9"A§,this);
         battleService.§3l§().§0!n§(this);
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         var _loc2_:int = 0;
         var _loc3_:§9"A§ = param1 as §9"A§;
         if(_loc3_ != null)
         {
            _loc2_ = _loc3_.targetingMode;
            this.changeState(this.§?";§(_loc2_));
         }
      }
      
      protected function changeState(param1:§if set case§) : void
      {
         this.§null set switch§ = param1;
      }
      
      protected function §?";§(param1:int) : §if set case§
      {
         switch(param1)
         {
            case §1!X§.§return for else§:
               return this.§if package§;
            case §1!X§.§'!Y§:
               return this.mouseState;
            default:
               return null;
         }
      }
      
      public function §3H§() : §try set for§
      {
         return this.§finally for var§;
      }
      
      public function §[!Q§() : void
      {
         this.§finally for var§.§if const native§();
         this.§finally for var§.§7"2§(0);
      }
      
      public function reset() : void
      {
         this.§[!Q§();
         this.§each set case§ = true;
      }
   }
}

