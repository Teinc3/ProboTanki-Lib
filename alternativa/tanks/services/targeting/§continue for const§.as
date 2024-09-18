package alternativa.tanks.services.targeting
{
   import §]#R§.§1!X§;
   import §]#R§.§catch const var§;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.logging.LogService;
   import alternativa.tanks.battle.events.§9"A§;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import flash.display.StageDisplayState;
   import flash.events.FullScreenEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.fullscreen.FullscreenService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.fullscreen.FullscreenStateService;
   
   public class §continue for const§ implements TargetingModeService, §9#j§
   {
      [Inject]
      public static var §9!U§:TargetingInputManager;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var logService:LogService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var §5b§:FullscreenStateService;
      
      [Inject]
      public static var §in package continue§:FullscreenService;
      
      [Inject]
      public static var settingsService:ISettingsService;
      
      [Inject]
      public static var §5!$§:KeysBindingService;
      
      private static const §with for native§:String = "fullScreenInteractiveAccepted";
      
      private static const MOUSE_LOCK:String = "mouseLock";
      
      private var §<!v§:int;
      
      private var §]7§:int;
      
      private var §="l§:§catch const var§;
      
      private var §7"s§:int;
      
      public function §continue for const§()
      {
         super();
      }
      
      public function init() : void
      {
         this.§<!v§ = §1!X§.§'@§;
         this.§]7§ = §1!X§.§return for else§;
         §9!U§.addListener(this);
         display.stage.addEventListener(FullScreenEvent.FULL_SCREEN,this.§3"M§);
         display.stage.addEventListener(§with for native§,this.§3"M§);
         this.§7"s§ = 0;
         if(§5b§.isFullscreen())
         {
            §9!U§.requestMouseLock();
         }
      }
      
      public function close() : void
      {
         display.stage.removeEventListener(§with for native§,this.§3"M§);
         display.stage.removeEventListener(FullScreenEvent.FULL_SCREEN,this.§3"M§);
         §9!U§.removeListener(this);
      }
      
      private function §3"M§(param1:FullScreenEvent) : void
      {
         if(param1.fullScreen && (param1.type == §with for native§ || §in package continue§.isStandAlone()) && settingsService.mouseControl)
         {
            §9!U§.requestMouseLock();
            §9!U§.§2q§();
         }
         else if(!param1.fullScreen && this.§<!v§ == §1!X§.§'!Y§)
         {
            this.§set const static§(§1!X§.§return for else§);
         }
      }
      
      public function tick() : void
      {
         if(this.§<!v§ == §1!X§.§'!Y§ && !settingsService.mouseControl)
         {
            this.§set const static§(§1!X§.§return for else§);
         }
         if(this.§]7§ != this.§<!v§)
         {
            if(this.§<!v§ == §1!X§.§'!Y§)
            {
               §9!U§.§native catch dynamic§();
            }
            this.§<!v§ = this.§]7§;
            battleEventDispatcher.dispatchEvent(new §9"A§(this.§<!v§));
         }
      }
      
      public function §;"W§() : int
      {
         return this.§<!v§;
      }
      
      public function mouseAbsoluteMovement(param1:Number, param2:Number) : void
      {
      }
      
      public function mouseRelativeMovement(param1:Number, param2:Number) : void
      {
      }
      
      public function mouseLeftButton(param1:Boolean, param2:Boolean) : Boolean
      {
         if(!§in package continue§.isMouseLockDisabled() && settingsService.mouseControl && this.§7"s§ == 0 && param1)
         {
            if(this.isInFullscreen() && !§in package continue§.isMouseLocked())
            {
               §9!U§.requestMouseLock();
               return false;
            }
            if(param2 && !this.isInFullscreen())
            {
               §in package continue§.switchFullscreen();
               return false;
            }
         }
         return true;
      }
      
      private function isInFullscreen() : Boolean
      {
         return display.stage.displayState != StageDisplayState.NORMAL;
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
         var _loc3_:* = false;
         if(param2 && this.§<!v§ != §1!X§.§return for else§ && this.§="l§ != null)
         {
            _loc3_ = §5!$§.§&!<§(param1) == this.§="l§.§with package throw§;
            _loc3_ ||= §5!$§.§&!<§(param1) == this.§="l§.§,#$§;
            _loc3_ ||= §5!$§.§&!<§(param1) == this.§="l§.§package const class§;
            if(_loc3_)
            {
               this.§set const static§(§1!X§.§return for else§);
               return false;
            }
         }
         return true;
      }
      
      private function §-3§(param1:uint, param2:Vector.<uint>) : Boolean
      {
         return param2 != null ? Boolean(param2.indexOf(param1) >= 0) : Boolean(false);
      }
      
      public function mouseLocked(param1:Boolean) : void
      {
         this.§set const static§(§1!X§.§'!Y§);
         §9!U§.§2q§();
      }
      
      private function §set const static§(param1:int) : void
      {
         if(param1 != this.§<!v§ && this.§7"s§ == 0)
         {
            this.§]7§ = param1;
         }
      }
      
      public function §`!G§(param1:§catch const var§) : void
      {
         this.§="l§ = param1;
      }
      
      public function §%"D§() : §catch const var§
      {
         return this.§="l§;
      }
      
      public function §8_§() : void
      {
         ++this.§7"s§;
      }
      
      public function § #J§() : void
      {
         --this.§7"s§;
         if(this.§7"s§ < 0)
         {
            this.§7"s§ = 0;
         }
      }
   }
}

