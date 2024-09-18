package alternativa.tanks.services.targeting
{
   import Renamed479.Renamed912;
   import Renamed479.Renamed3840;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.logging.LogService;
   import alternativa.tanks.battle.events.Renamed887;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import flash.display.StageDisplayState;
   import flash.events.FullScreenEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.fullscreen.FullscreenService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.fullscreen.FullscreenStateService;
   
   public class Renamed531 implements TargetingModeService, Renamed1497
   {
      [Inject]
      public static var Renamed1499:TargetingInputManager;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var logService:LogService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var Renamed3870:FullscreenStateService;
      
      [Inject]
      public static var Renamed3844:FullscreenService;
      
      [Inject]
      public static var settingsService:ISettingsService;
      
      [Inject]
      public static var Renamed719:KeysBindingService;
      
      private static const Renamed2619:String = "fullScreenInteractiveAccepted";
      
      private static const MOUSE_LOCK:String = "mouseLock";
      
      private var Renamed3871:int;
      
      private var Renamed3872:int;
      
      private var Renamed3873:Renamed3840;
      
      private var Renamed3874:int;
      
      public function Renamed531()
      {
         super();
      }
      
      public function init() : void
      {
         this.Renamed3871 = Renamed912.Renamed3875;
         this.Renamed3872 = Renamed912.Renamed1025;
         Renamed1499.addListener(this);
         display.stage.addEventListener(FullScreenEvent.FULL_SCREEN,this.Renamed3407);
         display.stage.addEventListener(Renamed2619,this.Renamed3407);
         this.Renamed3874 = 0;
         if(Renamed3870.isFullscreen())
         {
            Renamed1499.requestMouseLock();
         }
      }
      
      public function close() : void
      {
         display.stage.removeEventListener(Renamed2619,this.Renamed3407);
         display.stage.removeEventListener(FullScreenEvent.FULL_SCREEN,this.Renamed3407);
         Renamed1499.removeListener(this);
      }
      
      private function Renamed3407(param1:FullScreenEvent) : void
      {
         if(param1.fullScreen && (param1.type == Renamed2619 || Renamed3844.isStandAlone()) && settingsService.mouseControl)
         {
            Renamed1499.requestMouseLock();
            Renamed1499.Renamed3839();
         }
         else if(!param1.fullScreen && this.Renamed3871 == Renamed912.Renamed1026)
         {
            this.Renamed3876(Renamed912.Renamed1025);
         }
      }
      
      public function tick() : void
      {
         if(this.Renamed3871 == Renamed912.Renamed1026 && !settingsService.mouseControl)
         {
            this.Renamed3876(Renamed912.Renamed1025);
         }
         if(this.Renamed3872 != this.Renamed3871)
         {
            if(this.Renamed3871 == Renamed912.Renamed1026)
            {
               Renamed1499.Renamed3838();
            }
            this.Renamed3871 = this.Renamed3872;
            battleEventDispatcher.dispatchEvent(new Renamed887(this.Renamed3871));
         }
      }
      
      public function Renamed1024() : int
      {
         return this.Renamed3871;
      }
      
      public function mouseAbsoluteMovement(param1:Number, param2:Number) : void
      {
      }
      
      public function mouseRelativeMovement(param1:Number, param2:Number) : void
      {
      }
      
      public function mouseLeftButton(param1:Boolean, param2:Boolean) : Boolean
      {
         if(!Renamed3844.isMouseLockDisabled() && settingsService.mouseControl && this.Renamed3874 == 0 && param1)
         {
            if(this.isInFullscreen() && !Renamed3844.isMouseLocked())
            {
               Renamed1499.requestMouseLock();
               return false;
            }
            if(param2 && !this.isInFullscreen())
            {
               Renamed3844.switchFullscreen();
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
         if(param2 && this.Renamed3871 != Renamed912.Renamed1025 && this.Renamed3873 != null)
         {
            _loc3_ = Renamed719.Renamed729(param1) == this.Renamed3873.Renamed3877;
            _loc3_ ||= Renamed719.Renamed729(param1) == this.Renamed3873.Renamed3878;
            _loc3_ ||= Renamed719.Renamed729(param1) == this.Renamed3873.Renamed3879;
            if(_loc3_)
            {
               this.Renamed3876(Renamed912.Renamed1025);
               return false;
            }
         }
         return true;
      }
      
      private function Renamed3880(param1:uint, param2:Vector.<uint>) : Boolean
      {
         return param2 != null ? Boolean(param2.indexOf(param1) >= 0) : Boolean(false);
      }
      
      public function mouseLocked(param1:Boolean) : void
      {
         this.Renamed3876(Renamed912.Renamed1026);
         Renamed1499.Renamed3839();
      }
      
      private function Renamed3876(param1:int) : void
      {
         if(param1 != this.Renamed3871 && this.Renamed3874 == 0)
         {
            this.Renamed3872 = param1;
         }
      }
      
      public function Renamed3841(param1:Renamed3840) : void
      {
         this.Renamed3873 = param1;
      }
      
      public function Renamed3842() : Renamed3840
      {
         return this.Renamed3873;
      }
      
      public function Renamed3408() : void
      {
         ++this.Renamed3874;
      }
      
      public function Renamed3409() : void
      {
         --this.Renamed3874;
         if(this.Renamed3874 < 0)
         {
            this.Renamed3874 = 0;
         }
      }
   }
}

