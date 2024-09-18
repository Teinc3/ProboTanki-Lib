package alternativa.tanks.services.targeting
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.events.§##`§;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.§if false§;
   import alternativa.tanks.battle.events.§set var native§;
   import alternativa.tanks.battle.events.§throw package continue§;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import flash.display.Stage;
   import flash.display.StageDisplayState;
   import flash.events.Event;
   import flash.events.FullScreenEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.fullscreen.FullscreenService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   
   public class §+"S§ implements TargetingInputManager, §throw package continue§
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var §97§:ILobbyLayoutService;
      
      [Inject]
      public static var §^"<§:BattleInputService;
      
      [Inject]
      public static var §in package continue§:FullscreenService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private static const §`!+§:String = "movementX";
      
      private static const §for package set§:String = "movementY";
      
      private static const §&"V§:String = "rightMouseDown";
      
      private static const §]S§:String = "rightMouseUp";
      
      private static const §with for native§:String = "fullScreenInteractiveAccepted";
      
      private static const MOUSE_LOCK:String = "mouseLock";
      
      private var listeners:Vector.<§9#j§>;
      
      private var §#!<§:int = 0;
      
      private var active:Boolean = true;
      
      private var §!!K§:Boolean = false;
      
      private var §each for return§:Boolean = false;
      
      private var §9"#§:Boolean = false;
      
      private var §"!P§:int = 0;
      
      private var §@#&§:Boolean = false;
      
      private var §each static§:Boolean = false;
      
      private var §const package use§:Boolean = false;
      
      private var pause:Boolean = false;
      
      private var activate:Boolean = false;
      
      private var §=#o§:Boolean = false;
      
      private var §default set const§:Boolean = false;
      
      public function §+"S§()
      {
         this.listeners = new Vector.<§9#j§>();
         super();
      }
      
      public function init() : void
      {
         if(!this.§=#o§)
         {
            display.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            display.stage.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
            display.stage.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
            display.stage.addEventListener(§&"V§,this.§+;§);
            display.stage.addEventListener(§]S§,this.§true set get§);
            display.stage.addEventListener(MouseEvent.MOUSE_WHEEL,this.onMouseWheel);
            display.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
            display.stage.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
            display.stage.addEventListener(Event.ACTIVATE,this.§>"o§);
            display.stage.addEventListener(Event.DEACTIVATE,this.§2"o§);
            display.stage.addEventListener(FullScreenEvent.FULL_SCREEN,this.§3"M§);
            display.stage.addEventListener(§with for native§,this.§#M§);
            battleEventDispatcher.§set for each§(§##`§,this);
            battleEventDispatcher.§set for each§(§set var native§,this);
            this.listeners.length = 0;
            this.§#!<§ = 0;
            this.active = true;
            this.activate = false;
            this.pause = false;
            this.§@#&§ = false;
            this.§"!P§ = 0;
            this.§each for return§ = false;
            this.§!!K§ = false;
            this.§default set const§ = false;
            this.§=#o§ = true;
         }
      }
      
      public function close() : void
      {
         if(this.§=#o§)
         {
            display.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            display.stage.removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
            display.stage.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
            display.stage.removeEventListener(§&"V§,this.§+;§);
            display.stage.removeEventListener(§]S§,this.§true set get§);
            display.stage.removeEventListener(MouseEvent.MOUSE_WHEEL,this.onMouseWheel);
            display.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
            display.stage.removeEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
            display.stage.removeEventListener(Event.ACTIVATE,this.§>"o§);
            display.stage.removeEventListener(Event.DEACTIVATE,this.§2"o§);
            display.stage.removeEventListener(FullScreenEvent.FULL_SCREEN,this.§3"M§);
            display.stage.removeEventListener(§with for native§,this.§#M§);
            battleEventDispatcher.§7!3§(§##`§,this);
            battleEventDispatcher.§7!3§(§set var native§,this);
            this.listeners.length = 0;
            this.§=#o§ = false;
         }
      }
      
      private function §#M§(param1:FullScreenEvent) : void
      {
         if(param1.fullScreen)
         {
            this.§2q§();
         }
         this.§@#&§ = false;
      }
      
      private function §3"M§(param1:FullScreenEvent) : void
      {
         if(param1.fullScreen)
         {
            this.§2q§();
         }
         this.§@#&§ = param1.fullScreen && !§in package continue§.isStandAlone();
      }
      
      private function §+;§(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         if(this.§const var implements§(param1))
         {
            _loc2_ = 0;
            while(_loc2_ < this.listeners.length)
            {
               if(!§9#j§(this.listeners[_loc2_]).mouseRightButton(true,true))
               {
                  return;
               }
               _loc2_++;
            }
         }
      }
      
      private function §true set get§(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         if(this.§const var implements§(param1) && this.§"!P§ == 0)
         {
            _loc2_ = 0;
            while(_loc2_ < this.listeners.length)
            {
               if(!§9#j§(this.listeners[_loc2_]).mouseRightButton(false,true))
               {
                  return;
               }
               _loc2_++;
            }
         }
      }
      
      private function onMouseWheel(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         if(this.§const var implements§(param1) && this.§"!P§ == 0)
         {
            _loc2_ = 0;
            if(§in package continue§.isMouseLocked())
            {
               while(_loc2_ < this.listeners.length)
               {
                  §9#j§(this.listeners[_loc2_]).mouseWheel(param1.delta);
                  _loc2_++;
               }
            }
         }
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         if(this.§const var implements§(param1) && this.§"!P§ == 0)
         {
            if(this.§!!K§)
            {
               this.§!!K§ = false;
               return;
            }
            if(§in package continue§.isMouseLocked())
            {
               _loc2_ = 0;
               while(_loc2_ < this.listeners.length)
               {
                  §9#j§(this.listeners[_loc2_]).mouseRelativeMovement(param1[§`!+§],param1[§for package set§]);
                  _loc2_++;
               }
            }
            else
            {
               _loc2_ = 0;
               while(_loc2_ < this.listeners.length)
               {
                  §9#j§(this.listeners[_loc2_]).mouseAbsoluteMovement(param1.stageX,param1.stageY);
                  _loc2_++;
               }
            }
         }
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this.§const package use§ = true;
         if(this.§const var implements§(param1) && this.§"!P§ == 0)
         {
            this.§each static§ = true;
            this.§2!b§(true,true);
         }
      }
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         this.§const package use§ = false;
         if(this.§const var implements§(param1) && this.§"!P§ == 0)
         {
            this.§each static§ = false;
            this.§2!b§(false,true);
         }
      }
      
      private function §2!b§(param1:Boolean, param2:Boolean) : void
      {
         var _loc3_:int = 0;
         while(_loc3_ < this.listeners.length)
         {
            if(!§9#j§(this.listeners[_loc3_]).mouseLeftButton(param1,param2))
            {
               return;
            }
            _loc3_++;
         }
      }
      
      private function onKeyDown(param1:KeyboardEvent) : void
      {
         var _loc2_:int = 0;
         if(this.§case const extends§(param1) && this.§"!P§ == 0)
         {
            _loc2_ = 0;
            while(_loc2_ < this.listeners.length)
            {
               if(!§9#j§(this.listeners[_loc2_]).keyboardButton(param1.keyCode,true))
               {
                  return;
               }
               _loc2_++;
            }
         }
      }
      
      private function onKeyUp(param1:KeyboardEvent) : void
      {
         var _loc2_:int = 0;
         if(this.§case const extends§(param1) && this.§"!P§ == 0)
         {
            _loc2_ = 0;
            while(_loc2_ < this.listeners.length)
            {
               if(!§9#j§(this.listeners[_loc2_]).keyboardButton(param1.keyCode,false))
               {
                  return;
               }
               _loc2_++;
            }
         }
      }
      
      private function §>"o§(param1:Event) : void
      {
         if(!this.active)
         {
            this.activate = true;
            this.§2q§();
         }
      }
      
      private function §2"o§(param1:Event) : void
      {
         this.active = false;
      }
      
      public function tick() : void
      {
         if(this.§=#o§ && this.active)
         {
            if(this.§9"#§ && !this.§=!n§())
            {
               if(this.§each for return§)
               {
                  this.requestMouseLock();
               }
            }
            else if(!this.§9"#§ && this.§=!n§())
            {
               if(this.isInFullscreen())
               {
                  display.stage[MOUSE_LOCK] = false;
               }
            }
            this.§9"#§ = this.§=!n§();
            if(this.§"!P§ > 0)
            {
               --this.§"!P§;
            }
         }
         if(this.activate)
         {
            this.active = true;
            this.activate = false;
            if(this.isInFullscreen() && this.§each for return§)
            {
               this.requestMouseLock();
            }
         }
      }
      
      public function addListener(param1:§9#j§) : void
      {
         if(this.listeners.indexOf(param1) < 0)
         {
            this.listeners.push(param1);
         }
      }
      
      public function removeListener(param1:§9#j§) : void
      {
         this.listeners.splice(this.listeners.indexOf(param1),1);
      }
      
      public function §6c§() : void
      {
         this.§function const each§(false);
      }
      
      public function §switch while§() : void
      {
         this.§function const each§(true);
      }
      
      private function §function const each§(param1:Boolean) : void
      {
         if(this.§=#o§)
         {
            this.§default set const§ = param1;
            ++this.§#!<§;
            if(this.§#!<§ == 1)
            {
               battleEventDispatcher.dispatchEvent(new §if false§(false,param1));
            }
         }
      }
      
      private function isInFullscreen() : Boolean
      {
         return display.stage.displayState != StageDisplayState.NORMAL;
      }
      
      public function §return const class§() : void
      {
         if(this.§=#o§)
         {
            --this.§#!<§;
            if(this.§#!<§ <= 0)
            {
               this.§#!<§ = 0;
               battleEventDispatcher.dispatchEvent(new §if false§(true,this.§default set const§));
               this.§default set const§ = false;
               if(this.§const package use§ != this.§each static§)
               {
                  if(!this.§=!n§())
                  {
                     this.§2!b§(this.§const package use§,false);
                  }
                  this.§each static§ = this.§const package use§;
               }
            }
         }
      }
      
      public function requestMouseLock() : void
      {
         if(this.§=#o§)
         {
            if(!this.§=!n§())
            {
               §in package continue§.requestMouseLock();
            }
            else
            {
               this.§each for return§ = true;
            }
            if(§in package continue§.isMouseLocked())
            {
               this.§%s§(true);
               this.§!!K§ = true;
               this.§each for return§ = true;
            }
         }
      }
      
      private function §=!n§() : Boolean
      {
         return this.§#!<§ > 0 || this.§use set class§();
      }
      
      private function §use set class§() : Boolean
      {
         return !§97§.inBattle() || §97§.isSwitchInProgress() || §97§.isWindowOpenOverBattle() || this.§@#&§;
      }
      
      private function §const var implements§(param1:MouseEvent) : Boolean
      {
         return !§^"<§.§false set true§() && this.§%"m§(param1);
      }
      
      private function §case const extends§(param1:KeyboardEvent) : Boolean
      {
         return !§^"<§.§false set true§() && !this.pause && (!this.§use set class§() || this.§default set const§);
      }
      
      private function §%"m§(param1:MouseEvent) : Boolean
      {
         var _loc2_:* = !(param1.target is Stage);
         return this.active && !this.pause && !_loc2_ && !this.§=!n§();
      }
      
      public function §native catch dynamic§() : void
      {
         if(this.isInFullscreen())
         {
            display.stage[MOUSE_LOCK] = false;
            this.§%s§(false);
            this.§each for return§ = false;
         }
      }
      
      private function §%s§(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.listeners.length)
         {
            §9#j§(this.listeners[_loc2_]).mouseLocked(param1);
            _loc2_++;
         }
      }
      
      public function §2q§(param1:int = 1) : void
      {
         this.§"!P§ = param1;
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         if(param1 is §##`§)
         {
            this.pause = true;
         }
         else if(param1 is §set var native§)
         {
            this.pause = false;
         }
      }
   }
}

