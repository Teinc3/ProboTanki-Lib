package alternativa.tanks.services.targeting
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.events.Renamed874;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Renamed895;
   import alternativa.tanks.battle.events.Renamed900;
   import alternativa.tanks.battle.events.Renamed511;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import flash.display.Stage;
   import flash.display.StageDisplayState;
   import flash.events.Event;
   import flash.events.FullScreenEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.fullscreen.FullscreenService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   
   public class Renamed530 implements TargetingInputManager, Renamed511
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var Renamed3843:ILobbyLayoutService;
      
      [Inject]
      public static var Renamed718:BattleInputService;
      
      [Inject]
      public static var Renamed3844:FullscreenService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private static const Renamed3845:String = "movementX";
      
      private static const Renamed3846:String = "movementY";
      
      private static const Renamed3847:String = "rightMouseDown";
      
      private static const Renamed3848:String = "rightMouseUp";
      
      private static const Renamed2619:String = "fullScreenInteractiveAccepted";
      
      private static const MOUSE_LOCK:String = "mouseLock";
      
      private var listeners:Vector.<Renamed1497>;
      
      private var Renamed3849:int = 0;
      
      private var active:Boolean = true;
      
      private var Renamed3850:Boolean = false;
      
      private var Renamed3851:Boolean = false;
      
      private var Renamed3852:Boolean = false;
      
      private var Renamed3853:int = 0;
      
      private var Renamed3854:Boolean = false;
      
      private var Renamed3855:Boolean = false;
      
      private var Renamed3856:Boolean = false;
      
      private var pause:Boolean = false;
      
      private var activate:Boolean = false;
      
      private var Renamed3857:Boolean = false;
      
      private var Renamed896:Boolean = false;
      
      public function Renamed530()
      {
         this.listeners = new Vector.<Renamed1497>();
         super();
      }
      
      public function init() : void
      {
         if(!this.Renamed3857)
         {
            display.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            display.stage.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
            display.stage.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
            display.stage.addEventListener(Renamed3847,this.Renamed3858);
            display.stage.addEventListener(Renamed3848,this.Renamed3859);
            display.stage.addEventListener(MouseEvent.MOUSE_WHEEL,this.onMouseWheel);
            display.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
            display.stage.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
            display.stage.addEventListener(Event.ACTIVATE,this.Renamed713);
            display.stage.addEventListener(Event.DEACTIVATE,this.Renamed714);
            display.stage.addEventListener(FullScreenEvent.FULL_SCREEN,this.Renamed3407);
            display.stage.addEventListener(Renamed2619,this.Renamed3860);
            battleEventDispatcher.Renamed539(Renamed874,this);
            battleEventDispatcher.Renamed539(Renamed900,this);
            this.listeners.length = 0;
            this.Renamed3849 = 0;
            this.active = true;
            this.activate = false;
            this.pause = false;
            this.Renamed3854 = false;
            this.Renamed3853 = 0;
            this.Renamed3851 = false;
            this.Renamed3850 = false;
            this.Renamed896 = false;
            this.Renamed3857 = true;
         }
      }
      
      public function close() : void
      {
         if(this.Renamed3857)
         {
            display.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            display.stage.removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
            display.stage.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
            display.stage.removeEventListener(Renamed3847,this.Renamed3858);
            display.stage.removeEventListener(Renamed3848,this.Renamed3859);
            display.stage.removeEventListener(MouseEvent.MOUSE_WHEEL,this.onMouseWheel);
            display.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
            display.stage.removeEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
            display.stage.removeEventListener(Event.ACTIVATE,this.Renamed713);
            display.stage.removeEventListener(Event.DEACTIVATE,this.Renamed714);
            display.stage.removeEventListener(FullScreenEvent.FULL_SCREEN,this.Renamed3407);
            display.stage.removeEventListener(Renamed2619,this.Renamed3860);
            battleEventDispatcher.Renamed866(Renamed874,this);
            battleEventDispatcher.Renamed866(Renamed900,this);
            this.listeners.length = 0;
            this.Renamed3857 = false;
         }
      }
      
      private function Renamed3860(param1:FullScreenEvent) : void
      {
         if(param1.fullScreen)
         {
            this.Renamed3839();
         }
         this.Renamed3854 = false;
      }
      
      private function Renamed3407(param1:FullScreenEvent) : void
      {
         if(param1.fullScreen)
         {
            this.Renamed3839();
         }
         this.Renamed3854 = param1.fullScreen && !Renamed3844.isStandAlone();
      }
      
      private function Renamed3858(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         if(this.Renamed3861(param1))
         {
            _loc2_ = 0;
            while(_loc2_ < this.listeners.length)
            {
               if(!Renamed1497(this.listeners[_loc2_]).mouseRightButton(true,true))
               {
                  return;
               }
               _loc2_++;
            }
         }
      }
      
      private function Renamed3859(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         if(this.Renamed3861(param1) && this.Renamed3853 == 0)
         {
            _loc2_ = 0;
            while(_loc2_ < this.listeners.length)
            {
               if(!Renamed1497(this.listeners[_loc2_]).mouseRightButton(false,true))
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
         if(this.Renamed3861(param1) && this.Renamed3853 == 0)
         {
            _loc2_ = 0;
            if(Renamed3844.isMouseLocked())
            {
               while(_loc2_ < this.listeners.length)
               {
                  Renamed1497(this.listeners[_loc2_]).mouseWheel(param1.delta);
                  _loc2_++;
               }
            }
         }
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         if(this.Renamed3861(param1) && this.Renamed3853 == 0)
         {
            if(this.Renamed3850)
            {
               this.Renamed3850 = false;
               return;
            }
            if(Renamed3844.isMouseLocked())
            {
               _loc2_ = 0;
               while(_loc2_ < this.listeners.length)
               {
                  Renamed1497(this.listeners[_loc2_]).mouseRelativeMovement(param1[Renamed3845],param1[Renamed3846]);
                  _loc2_++;
               }
            }
            else
            {
               _loc2_ = 0;
               while(_loc2_ < this.listeners.length)
               {
                  Renamed1497(this.listeners[_loc2_]).mouseAbsoluteMovement(param1.stageX,param1.stageY);
                  _loc2_++;
               }
            }
         }
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this.Renamed3856 = true;
         if(this.Renamed3861(param1) && this.Renamed3853 == 0)
         {
            this.Renamed3855 = true;
            this.Renamed3862(true,true);
         }
      }
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         this.Renamed3856 = false;
         if(this.Renamed3861(param1) && this.Renamed3853 == 0)
         {
            this.Renamed3855 = false;
            this.Renamed3862(false,true);
         }
      }
      
      private function Renamed3862(param1:Boolean, param2:Boolean) : void
      {
         var _loc3_:int = 0;
         while(_loc3_ < this.listeners.length)
         {
            if(!Renamed1497(this.listeners[_loc3_]).mouseLeftButton(param1,param2))
            {
               return;
            }
            _loc3_++;
         }
      }
      
      private function onKeyDown(param1:KeyboardEvent) : void
      {
         var _loc2_:int = 0;
         if(this.Renamed3863(param1) && this.Renamed3853 == 0)
         {
            _loc2_ = 0;
            while(_loc2_ < this.listeners.length)
            {
               if(!Renamed1497(this.listeners[_loc2_]).keyboardButton(param1.keyCode,true))
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
         if(this.Renamed3863(param1) && this.Renamed3853 == 0)
         {
            _loc2_ = 0;
            while(_loc2_ < this.listeners.length)
            {
               if(!Renamed1497(this.listeners[_loc2_]).keyboardButton(param1.keyCode,false))
               {
                  return;
               }
               _loc2_++;
            }
         }
      }
      
      private function Renamed713(param1:Event) : void
      {
         if(!this.active)
         {
            this.activate = true;
            this.Renamed3839();
         }
      }
      
      private function Renamed714(param1:Event) : void
      {
         this.active = false;
      }
      
      public function tick() : void
      {
         if(this.Renamed3857 && this.active)
         {
            if(this.Renamed3852 && !this.Renamed3864())
            {
               if(this.Renamed3851)
               {
                  this.requestMouseLock();
               }
            }
            else if(!this.Renamed3852 && this.Renamed3864())
            {
               if(this.isInFullscreen())
               {
                  display.stage[MOUSE_LOCK] = false;
               }
            }
            this.Renamed3852 = this.Renamed3864();
            if(this.Renamed3853 > 0)
            {
               --this.Renamed3853;
            }
         }
         if(this.activate)
         {
            this.active = true;
            this.activate = false;
            if(this.isInFullscreen() && this.Renamed3851)
            {
               this.requestMouseLock();
            }
         }
      }
      
      public function addListener(param1:Renamed1497) : void
      {
         if(this.listeners.indexOf(param1) < 0)
         {
            this.listeners.push(param1);
         }
      }
      
      public function removeListener(param1:Renamed1497) : void
      {
         this.listeners.splice(this.listeners.indexOf(param1),1);
      }
      
      public function Renamed2632() : void
      {
         this.Renamed3865(false);
      }
      
      public function Renamed3837() : void
      {
         this.Renamed3865(true);
      }
      
      private function Renamed3865(param1:Boolean) : void
      {
         if(this.Renamed3857)
         {
            this.Renamed896 = param1;
            ++this.Renamed3849;
            if(this.Renamed3849 == 1)
            {
               battleEventDispatcher.dispatchEvent(new Renamed895(false,param1));
            }
         }
      }
      
      private function isInFullscreen() : Boolean
      {
         return display.stage.displayState != StageDisplayState.NORMAL;
      }
      
      public function Renamed2637() : void
      {
         if(this.Renamed3857)
         {
            --this.Renamed3849;
            if(this.Renamed3849 <= 0)
            {
               this.Renamed3849 = 0;
               battleEventDispatcher.dispatchEvent(new Renamed895(true,this.Renamed896));
               this.Renamed896 = false;
               if(this.Renamed3856 != this.Renamed3855)
               {
                  if(!this.Renamed3864())
                  {
                     this.Renamed3862(this.Renamed3856,false);
                  }
                  this.Renamed3855 = this.Renamed3856;
               }
            }
         }
      }
      
      public function requestMouseLock() : void
      {
         if(this.Renamed3857)
         {
            if(!this.Renamed3864())
            {
               Renamed3844.requestMouseLock();
            }
            else
            {
               this.Renamed3851 = true;
            }
            if(Renamed3844.isMouseLocked())
            {
               this.Renamed3866(true);
               this.Renamed3850 = true;
               this.Renamed3851 = true;
            }
         }
      }
      
      private function Renamed3864() : Boolean
      {
         return this.Renamed3849 > 0 || this.Renamed3867();
      }
      
      private function Renamed3867() : Boolean
      {
         return !Renamed3843.inBattle() || Renamed3843.isSwitchInProgress() || Renamed3843.isWindowOpenOverBattle() || this.Renamed3854;
      }
      
      private function Renamed3861(param1:MouseEvent) : Boolean
      {
         return !Renamed718.Renamed728() && this.Renamed3868(param1);
      }
      
      private function Renamed3863(param1:KeyboardEvent) : Boolean
      {
         return !Renamed718.Renamed728() && !this.pause && (!this.Renamed3867() || this.Renamed896);
      }
      
      private function Renamed3868(param1:MouseEvent) : Boolean
      {
         var _loc2_:* = !(param1.target is Stage);
         return this.active && !this.pause && !_loc2_ && !this.Renamed3864();
      }
      
      public function Renamed3838() : void
      {
         if(this.isInFullscreen())
         {
            display.stage[MOUSE_LOCK] = false;
            this.Renamed3866(false);
            this.Renamed3851 = false;
         }
      }
      
      private function Renamed3866(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.listeners.length)
         {
            Renamed1497(this.listeners[_loc2_]).mouseLocked(param1);
            _loc2_++;
         }
      }
      
      public function Renamed3839(param1:int = 1) : void
      {
         this.Renamed3853 = param1;
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         if(param1 is Renamed874)
         {
            this.pause = true;
         }
         else if(param1 is Renamed900)
         {
            this.pause = false;
         }
      }
   }
}

