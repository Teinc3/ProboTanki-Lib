package §]i§
{
   import §!!v§.§get for null§;
   import §!!v§.§use catch true§;
   import §"!4§.§"s§;
   import §"!4§.§for const case§;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.events.§7o§;
   import alternativa.tanks.battle.events.§;!?§;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.§]!`§;
   import alternativa.tanks.battle.events.§const var finally§;
   import alternativa.tanks.battle.events.§throw package continue§;
   import alternativa.tanks.battle.events.§var use§;
   import alternativa.tanks.service.settings.keybinding.§&7§;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import alternativa.tanks.services.battleinput.BattleInputLockEvent;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import alternativa.tanks.utils.§if for const§;
   import controls.InventoryIcon;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   
   public class §'#;§ extends §for const case§ implements §"s§, §dynamic var while§, §use catch true§, §throw package continue§
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var §^"<§:BattleInputService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var §]!W§:BattleGUIService;
      
      [Inject]
      public static var §5!$§:KeysBindingService;
      
      [Inject]
      public static var battleService:BattleService;
      
      private static const §`"d§:int = 50;
      
      private var container:DisplayObjectContainer;
      
      private var §71§:Vector.<§final set if§>;
      
      private var §%"Z§:Dictionary;
      
      private var §"&§:§var use§;
      
      private var §>!_§:§if for const§;
      
      private var §-"S§:§2#_§;
      
      private var §get var finally§:int;
      
      public function §'#;§()
      {
         this.§%"Z§ = new Dictionary();
         super();
         this.§>!_§ = new §if for const§();
         this.§"&§ = new §var use§(battleEventDispatcher,this);
         this.§"&§.§#"<§(§7o§,this.§;!H§);
         this.§"&§.§#"<§(§]!`§,this.§##C§);
         this.§"&§.§#"<§(§const var finally§,this.§get const case§);
         this.§"&§.§#"<§(§;!?§,this.§#!H§);
      }
      
      public function §#!H§(param1:§;!?§) : void
      {
         var _loc2_:§final set if§ = null;
         var _loc3_:§1!;§ = null;
         if(param1.isLocal)
         {
            for each(_loc2_ in this.§71§)
            {
               _loc3_ = _loc2_.getItem();
               if(_loc3_ != null)
               {
                  _loc3_.§2U§();
               }
            }
         }
      }
      
      public function §##C§(param1:Object) : void
      {
         this.§if set null§(§get for null§.§throw for§,true);
      }
      
      private function §get const case§(param1:§const var finally§) : void
      {
         var _loc2_:§final set if§ = null;
         var _loc3_:§1!;§ = null;
         this.§if set null§(§get for null§.§throw for§,true);
         for each(_loc2_ in this.§71§)
         {
            _loc3_ = _loc2_.getItem();
            if(_loc3_ != null)
            {
               _loc3_.§2U§();
            }
         }
      }
      
      public function objectLoaded() : void
      {
         this.§-"S§ = §2#_§(modelRegistry.getModelsByInterface(§2#_§)[0]);
         this.container = new Sprite();
         this.container.visible = false;
         §]!W§.§break var implements§();
         §]!W§.§break catch true§().addChild(this.container);
         this.§"&§.§throw var set§();
         this.§set for try§();
         this.§case const in§();
         display.stage.addEventListener(Event.RESIZE,this.onResize);
         this.onResize(null);
      }
      
      public function objectUnloaded() : void
      {
         if(this.§71§ == null)
         {
            return;
         }
         var _loc1_:int = 0;
         while(_loc1_ < this.§71§.length)
         {
            this.§=!o§(_loc1_);
            _loc1_++;
         }
         this.§71§ = null;
         §]!W§.§break catch true§().removeChild(this.container);
         this.container = null;
         display.stage.removeEventListener(Event.RESIZE,this.onResize);
         this.§"&§.§#!V§();
         §^"<§.removeEventListener(BattleInputLockEvent.INPUT_LOCKED,this.§@#%§);
         §^"<§.removeEventListener(BattleInputLockEvent.INPUT_UNLOCKED,this.§null package import§);
      }
      
      public function §function try§(param1:§1!;§, param2:int) : void
      {
         if(this.§function var true§() == 0)
         {
            display.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
            display.stage.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
            display.stage.addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         }
         §final set if§(this.§71§[param2]).setItem(param1);
         if(param1.count > 0 || param1.count == -1)
         {
            this.container.visible = true;
         }
      }
      
      public function itemUpdateCount(param1:§1!;§) : void
      {
         var _loc2_:§final set if§ = null;
         if(param1.count > 0 && !this.container.visible)
         {
            this.container.visible = true;
         }
         for each(_loc2_ in this.§71§)
         {
            if(_loc2_.getItem() == param1)
            {
               _loc2_.§else const null§();
            }
         }
      }
      
      public function initItemSlot(param1:§1!;§) : void
      {
         var _loc2_:§final set if§ = null;
         for each(_loc2_ in this.§71§)
         {
            if(_loc2_.getItem() == param1)
            {
               _loc2_.§false package true§();
            }
         }
      }
      
      public function §<r§(param1:§1!;§) : void
      {
         var _loc2_:§final set if§ = null;
         for each(_loc2_ in this.§71§)
         {
            if(_loc2_.getItem() == param1)
            {
               _loc2_.§else const null§();
            }
         }
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         this.§"&§.handleBattleEvent(param1);
      }
      
      public function §false var break§(param1:§1!;§) : void
      {
         var _loc2_:§final set if§ = null;
         for each(_loc2_ in this.§71§)
         {
            if(_loc2_.getItem() == param1)
            {
               _loc2_.§else const null§();
            }
         }
      }
      
      public function §6#C§(param1:int, param2:int, param3:Boolean) : void
      {
         var _loc4_:§final set if§ = null;
         var _loc5_:§1!;§ = null;
         for each(_loc4_ in this.§71§)
         {
            _loc5_ = _loc4_.getItem();
            if(_loc5_ != null && _loc5_.getId() == param1)
            {
               _loc4_.§8!-§(param2,param3);
            }
         }
      }
      
      private function §@#%§(param1:BattleInputLockEvent) : void
      {
         this.§if set null§(§get for null§.§<0§,true);
      }
      
      private function §null package import§(param1:BattleInputLockEvent) : void
      {
         this.§if set null§(§get for null§.§<0§,false);
      }
      
      private function §;!H§(param1:Object) : void
      {
         var _loc2_:§final set if§ = null;
         var _loc3_:§1!;§ = null;
         for each(_loc2_ in this.§71§)
         {
            _loc2_.§8!-§(§get for null§.§throw for§,false);
            _loc2_.§4o§(getTimer());
            _loc2_.§7#4§(getTimer());
            _loc3_ = _loc2_.getItem();
            if(_loc3_ != null && _loc3_.§for var with§() <= 75000)
            {
               _loc3_.§2U§();
            }
         }
      }
      
      public function §if set null§(param1:int, param2:Boolean) : void
      {
         var _loc3_:§final set if§ = null;
         for each(_loc3_ in this.§71§)
         {
            _loc3_.§8!-§(param1,param2);
         }
      }
      
      private function onResize(param1:Event) : void
      {
         this.container.x = 0;
         this.container.y = display.stage.stageHeight - §`"d§;
      }
      
      private function §set for try§() : void
      {
         var _loc5_:§final set if§ = null;
         var _loc6_:DisplayObject = null;
         var _loc1_:int = 5;
         this.§71§ = new Vector.<§final set if§>(_loc1_);
         var _loc2_:int = 10 + new InventoryIcon(InventoryIcon.EMPTY).width;
         var _loc3_:int = 10;
         var _loc4_:int = 0;
         while(_loc4_ < _loc1_)
         {
            _loc5_ = new §final set if§(_loc4_ + 1);
            this.§71§[_loc4_] = _loc5_;
            (_loc6_ = _loc5_.§set set catch§()).x = _loc3_;
            this.container.addChild(_loc6_);
            _loc3_ += _loc2_;
            _loc4_++;
         }
         §^"<§.addEventListener(BattleInputLockEvent.INPUT_LOCKED,this.§@#%§);
         §^"<§.addEventListener(BattleInputLockEvent.INPUT_UNLOCKED,this.§null package import§);
      }
      
      private function onKeyDown(param1:KeyboardEvent) : void
      {
         if(this.§>!_§.§&#_§(param1.keyCode))
         {
            return;
         }
         var _loc2_:§&7§ = §5!$§.§&!<§(param1.keyCode);
         var _loc3_:* = this.§%"Z§[_loc2_];
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:int = _loc3_;
         var _loc5_:§final set if§ = this.§71§[_loc4_];
         if(_loc5_.isLocked())
         {
            return;
         }
         var _loc6_:§1!;§ = _loc5_.getItem();
         if(_loc6_ != null)
         {
            this.§>!_§.§try var do§(param1.keyCode);
            this.§-"S§.§try for do§(_loc6_);
         }
      }
      
      private function onKeyUp(param1:KeyboardEvent) : void
      {
         if(this.§>!_§.§&#_§(param1.keyCode))
         {
            this.§>!_§.§3t§(param1.keyCode);
         }
      }
      
      private function §function var true§() : int
      {
         var _loc1_:int = 0;
         var _loc2_:§final set if§ = null;
         for each(_loc2_ in this.§71§)
         {
            if(_loc2_.getItem() != null)
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      private function §=!o§(param1:int) : void
      {
         var _loc2_:§final set if§ = this.§71§[param1];
         _loc2_.setItem(null);
         if(this.§function var true§() == 0)
         {
            display.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
            display.stage.removeEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
            display.stage.removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         }
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         var _loc3_:§final set if§ = null;
         var _loc2_:int = getTimer();
         for each(_loc3_ in this.§71§)
         {
            _loc3_.update(_loc2_);
         }
      }
      
      private function §case const in§() : void
      {
         this.§%"Z§[49] = 0;
         this.§%"Z§[§&7§.USE_FIRS_AID] = 0;
         this.§%"Z§[50] = 1;
         this.§%"Z§[§&7§.USE_DOUBLE_ARMOR] = 1;
         this.§%"Z§[51] = 2;
         this.§%"Z§[§&7§.USE_DOUBLE_DAMAGE] = 2;
         this.§%"Z§[52] = 3;
         this.§%"Z§[§&7§.USE_NITRO] = 3;
         this.§%"Z§[53] = 4;
         this.§%"Z§[§&7§.USE_MINE] = 4;
      }
   }
}

