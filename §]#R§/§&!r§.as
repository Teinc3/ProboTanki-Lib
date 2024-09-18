package §]#R§
{
   import alternativa.osgi.service.command.CommandService;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.§if false§;
   import alternativa.tanks.battle.events.§throw package continue§;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.service.settings.keybinding.§&7§;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import alternativa.tanks.utils.MathUtils;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   
   public class §&!r§ extends §^#Z§ implements §throw package continue§
   {
      [Inject]
      public static var commandService:CommandService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var §#!'§:KeysBindingService;
      
      private static const §;#t§:int = 1 << §3!%§;
      
      private var listener:§[#6§;
      
      private var §const package true§:int;
      
      private var §?#h§:Boolean = true;
      
      public function §&!r§(param1:Tank, param2:§[#6§)
      {
         super(param1);
         this.listener = param2;
         display.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKey);
         display.stage.addEventListener(KeyboardEvent.KEY_UP,this.onKey);
         display.stage.addEventListener(Event.DEACTIVATE,this.§else set class§);
         battleEventDispatcher.§set for each§(§if false§,this);
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         var _loc2_:§if false§ = null;
         if(param1 is §if false§)
         {
            _loc2_ = §if false§(param1);
            if(!this.§?#h§ && _loc2_.enabled && !_loc2_.§default set const§)
            {
               §7"2§(0);
            }
            this.§?#h§ = _loc2_.enabled;
         }
      }
      
      private function onKey(param1:KeyboardEvent) : void
      {
         var _loc2_:* = 0;
         var _loc3_:§&7§ = §#!'§.§&!<§(param1.keyCode);
         if(!_loc3_)
         {
            return;
         }
         var _loc4_:int = §var for if§;
         var _loc5_:* = param1.type == KeyboardEvent.KEY_DOWN;
         switch(_loc3_)
         {
            case §&7§.CHASSIS_FORWARD_MOVEMENT:
               _loc4_ = MathUtils.changeBitValue(§var for if§,§function catch finally§,_loc5_);
               break;
            case §&7§.CHASSIS_BACKWARD_MOVEMENT:
               _loc4_ = MathUtils.changeBitValue(§var for if§,§while for for§,_loc5_);
               break;
            case §&7§.CHASSIS_LEFT_MOVEMENT:
               _loc4_ = MathUtils.changeBitValue(§var for if§,§!#`§,_loc5_);
               break;
            case §&7§.CHASSIS_RIGHT_MOVEMENT:
               _loc4_ = MathUtils.changeBitValue(§var for if§,§""?§,_loc5_);
         }
         if(_loc4_ != §var for if§)
         {
            _loc2_ = _loc4_ | this.§const package true§;
            §7"2§(_loc2_);
         }
      }
      
      private function §else set class§(param1:Event) : void
      {
         §7"2§(0);
      }
      
      override protected function §!q§(param1:int) : void
      {
         this.listener.§true package var§(param1);
      }
      
      public function §"!w§(param1:Boolean) : void
      {
         if(param1)
         {
            this.§const package true§ = §;#t§;
         }
         else
         {
            this.§const package true§ = 0;
            §var for if§ &= ~§;#t§;
         }
      }
      
      [Obfuscation(rename="false")]
      override public function close() : void
      {
         super.close();
         display.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKey);
         display.stage.removeEventListener(KeyboardEvent.KEY_UP,this.onKey);
         display.stage.removeEventListener(Event.DEACTIVATE,this.§else set class§);
         battleEventDispatcher.§7!3§(§if false§,this);
      }
   }
}

