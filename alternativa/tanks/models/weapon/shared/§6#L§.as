package alternativa.tanks.models.weapon.shared
{
   import §]#R§.§1!X§;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.events.§##`§;
   import alternativa.tanks.battle.events.§9"A§;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.§if false§;
   import alternativa.tanks.battle.events.§set var native§;
   import alternativa.tanks.battle.events.§throw package continue§;
   import alternativa.tanks.battle.objects.tank.§class package try§;
   import alternativa.tanks.models.battle.gui.chat.§switch set in§;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.service.settings.keybinding.§&7§;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import alternativa.tanks.services.targeting.§9#j§;
   import alternativa.tanks.services.targeting.TargetingInputManager;
   import alternativa.tanks.services.targeting.TargetingModeService;
   import flash.events.Event;
   import flash.events.FullScreenEvent;
   
   public class §6#L§ implements §throw package continue§, §9#j§
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var §9!U§:TargetingInputManager;
      
      [Inject]
      public static var §default package import§:TargetingModeService;
      
      [Inject]
      public static var settingsService:ISettingsService;
      
      [Inject]
      public static var §5!$§:KeysBindingService;
      
      private var weapon:§class package try§;
      
      private var §,#P§:Boolean;
      
      private var §true catch var§:Boolean;
      
      private var §%J§:Boolean = false;
      
      private var §implements package try§:Vector.<Boolean>;
      
      private var pause:Boolean;
      
      private var targetingMode:int;
      
      public function §6#L§()
      {
         this.§implements package try§ = new Vector.<Boolean>(255);
         super();
      }
      
      public function setWeapon(param1:§class package try§) : void
      {
         this.weapon = param1;
      }
      
      public function §-"'§() : Boolean
      {
         return this.§,#P§ || this.§true catch var§;
      }
      
      public function §override for var§() : Boolean
      {
         return this.§,#P§;
      }
      
      public function §with const function§() : void
      {
         this.§true catch var§ = false;
      }
      
      public function init() : void
      {
         display.stage.addEventListener(Event.DEACTIVATE,this.§else set class§);
         display.stage.addEventListener(Event.MOUSE_LEAVE,this.§%!s§);
         display.stage.addEventListener(FullScreenEvent.FULL_SCREEN,this.§3"M§);
         battleEventDispatcher.§set for each§(§set var native§,this);
         battleEventDispatcher.§set for each§(§##`§,this);
         battleEventDispatcher.§set for each§(§9"A§,this);
         battleEventDispatcher.§set for each§(§if false§,this);
         battleEventDispatcher.§set for each§(§switch set in§,this);
         §9!U§.addListener(this);
         this.pause = false;
      }
      
      public function destroy() : void
      {
         display.stage.removeEventListener(Event.DEACTIVATE,this.§else set class§);
         display.stage.removeEventListener(Event.MOUSE_LEAVE,this.§%!s§);
         display.stage.removeEventListener(FullScreenEvent.FULL_SCREEN,this.§3"M§);
         battleEventDispatcher.§7!3§(§set var native§,this);
         battleEventDispatcher.§7!3§(§##`§,this);
         battleEventDispatcher.§7!3§(§9"A§,this);
         battleEventDispatcher.§7!3§(§if false§,this);
         battleEventDispatcher.§7!3§(§switch set in§,this);
         §9!U§.removeListener(this);
      }
      
      private function §3"M§(param1:FullScreenEvent) : void
      {
         this.§#w§();
      }
      
      private function §%!s§(param1:Event) : void
      {
         this.§#w§();
      }
      
      private function §;>§(param1:Boolean) : void
      {
         this.§,#P§ = true;
         this.§true catch var§ = true;
         §default package import§.§8_§();
         if(this.weapon != null)
         {
            if(param1 && this.targetingMode == §1!X§.§return for else§)
            {
               return;
            }
            this.weapon.§;>§();
         }
      }
      
      public function §+"[§(param1:uint) : Boolean
      {
         return param1 < 256 ? Boolean(this.§implements package try§[param1]) : Boolean(false);
      }
      
      private function §#w§() : void
      {
         var _loc1_:Boolean = this.§,#P§;
         this.§,#P§ = false;
         if(_loc1_ && this.weapon != null)
         {
            this.weapon.§#w§();
         }
         §default package import§.§ #J§();
      }
      
      private function §else set class§(param1:Event) : void
      {
         this.§,#P§ = false;
         this.§true catch var§ = false;
         if(this.weapon != null)
         {
            this.weapon.§#w§();
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.§implements package try§.length)
         {
            this.§implements package try§[_loc2_] = false;
            _loc2_++;
         }
         §default package import§.§ #J§();
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         var _loc2_:§if false§ = null;
         if(param1 is §set var native§)
         {
            this.pause = false;
         }
         else if(param1 is §##`§)
         {
            this.pause = true;
         }
         else if(param1 is §9"A§)
         {
            this.targetingMode = §9"A§(param1).targetingMode;
         }
         else if(param1 is §if false§)
         {
            _loc2_ = §if false§(param1);
            if(this.§,#P§ && this.§%J§ && !_loc2_.§default set const§)
            {
               this.§#w§();
            }
            this.pause = !§if false§(param1).enabled;
         }
         else if(param1 is §switch set in§)
         {
            if(this.§,#P§)
            {
               this.§#w§();
            }
         }
      }
      
      public function mouseAbsoluteMovement(param1:Number, param2:Number) : void
      {
      }
      
      public function mouseRelativeMovement(param1:Number, param2:Number) : void
      {
      }
      
      public function mouseLeftButton(param1:Boolean, param2:Boolean) : Boolean
      {
         if(!this.pause && settingsService.mouseControl && §default package import§.§;"W§() == §1!X§.§'!Y§)
         {
            if(!this.§,#P§ && param1)
            {
               this.§;>§(true);
               this.§%J§ = false;
            }
            else if(this.§,#P§ && !this.§%J§ && !param1)
            {
               this.§#w§();
            }
         }
         return true;
      }
      
      public function mouseWheel(param1:int) : void
      {
      }
      
      public function mouseRightButton(param1:Boolean, param2:Boolean) : Boolean
      {
         return true;
      }
      
      public function keyboardButton(param1:uint, param2:Boolean) : Boolean
      {
         var _loc3_:§&7§ = §5!$§.§&!<§(param1);
         if(param2)
         {
            if(_loc3_ == §&7§.SHOT && !this.§,#P§)
            {
               this.§;>§(false);
               this.§%J§ = true;
            }
            if(param1 < 256)
            {
               this.§implements package try§[param1] = true;
            }
         }
         else
         {
            if(_loc3_ == §&7§.SHOT && this.§,#P§ && this.§%J§)
            {
               this.§#w§();
            }
            if(param1 < 256)
            {
               this.§implements package try§[param1] = false;
            }
         }
         return true;
      }
      
      public function mouseLocked(param1:Boolean) : void
      {
         if(this.§,#P§ && this.§%J§)
         {
            this.§#w§();
         }
      }
   }
}

