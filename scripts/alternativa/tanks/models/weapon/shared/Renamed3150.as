package alternativa.tanks.models.weapon.shared
{
   import Renamed479.Renamed912;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.events.Renamed874;
   import alternativa.tanks.battle.events.Renamed887;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Renamed895;
   import alternativa.tanks.battle.events.Renamed900;
   import alternativa.tanks.battle.events.Renamed511;
   import alternativa.tanks.battle.objects.tank.Renamed1150;
   import alternativa.tanks.models.battle.gui.chat.Renamed2630;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.service.settings.keybinding.Renamed717;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import alternativa.tanks.services.targeting.Renamed1497;
   import alternativa.tanks.services.targeting.TargetingInputManager;
   import alternativa.tanks.services.targeting.TargetingModeService;
   import flash.events.Event;
   import flash.events.FullScreenEvent;
   
   public class Renamed3150 implements Renamed511, Renamed1497
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var Renamed1499:TargetingInputManager;
      
      [Inject]
      public static var Renamed926:TargetingModeService;
      
      [Inject]
      public static var settingsService:ISettingsService;
      
      [Inject]
      public static var Renamed719:KeysBindingService;
      
      private var weapon:Renamed1150;
      
      private var Renamed3399:Boolean;
      
      private var Renamed3400:Boolean;
      
      private var Renamed3401:Boolean = false;
      
      private var Renamed3402:Vector.<Boolean>;
      
      private var pause:Boolean;
      
      private var targetingMode:int;
      
      public function Renamed3150()
      {
         this.Renamed3402 = new Vector.<Boolean>(255);
         super();
      }
      
      public function setWeapon(param1:Renamed1150) : void
      {
         this.weapon = param1;
      }
      
      public function Renamed3403() : Boolean
      {
         return this.Renamed3399 || this.Renamed3400;
      }
      
      public function Renamed3209() : Boolean
      {
         return this.Renamed3399;
      }
      
      public function Renamed3404() : void
      {
         this.Renamed3400 = false;
      }
      
      public function init() : void
      {
         display.stage.addEventListener(Event.DEACTIVATE,this.Renamed3405);
         display.stage.addEventListener(Event.MOUSE_LEAVE,this.Renamed3406);
         display.stage.addEventListener(FullScreenEvent.FULL_SCREEN,this.Renamed3407);
         battleEventDispatcher.Renamed539(Renamed900,this);
         battleEventDispatcher.Renamed539(Renamed874,this);
         battleEventDispatcher.Renamed539(Renamed887,this);
         battleEventDispatcher.Renamed539(Renamed895,this);
         battleEventDispatcher.Renamed539(Renamed2630,this);
         Renamed1499.addListener(this);
         this.pause = false;
      }
      
      public function destroy() : void
      {
         display.stage.removeEventListener(Event.DEACTIVATE,this.Renamed3405);
         display.stage.removeEventListener(Event.MOUSE_LEAVE,this.Renamed3406);
         display.stage.removeEventListener(FullScreenEvent.FULL_SCREEN,this.Renamed3407);
         battleEventDispatcher.Renamed866(Renamed900,this);
         battleEventDispatcher.Renamed866(Renamed874,this);
         battleEventDispatcher.Renamed866(Renamed887,this);
         battleEventDispatcher.Renamed866(Renamed895,this);
         battleEventDispatcher.Renamed866(Renamed2630,this);
         Renamed1499.removeListener(this);
      }
      
      private function Renamed3407(param1:FullScreenEvent) : void
      {
         this.Renamed1152();
      }
      
      private function Renamed3406(param1:Event) : void
      {
         this.Renamed1152();
      }
      
      private function Renamed1151(param1:Boolean) : void
      {
         this.Renamed3399 = true;
         this.Renamed3400 = true;
         Renamed926.Renamed3408();
         if(this.weapon != null)
         {
            if(param1 && this.targetingMode == Renamed912.Renamed1025)
            {
               return;
            }
            this.weapon.Renamed1151();
         }
      }
      
      public function Renamed3344(param1:uint) : Boolean
      {
         return param1 < 256 ? Boolean(this.Renamed3402[param1]) : Boolean(false);
      }
      
      private function Renamed1152() : void
      {
         var _loc1_:Boolean = this.Renamed3399;
         this.Renamed3399 = false;
         if(_loc1_ && this.weapon != null)
         {
            this.weapon.Renamed1152();
         }
         Renamed926.Renamed3409();
      }
      
      private function Renamed3405(param1:Event) : void
      {
         this.Renamed3399 = false;
         this.Renamed3400 = false;
         if(this.weapon != null)
         {
            this.weapon.Renamed1152();
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.Renamed3402.length)
         {
            this.Renamed3402[_loc2_] = false;
            _loc2_++;
         }
         Renamed926.Renamed3409();
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         var _loc2_:Renamed895 = null;
         if(param1 is Renamed900)
         {
            this.pause = false;
         }
         else if(param1 is Renamed874)
         {
            this.pause = true;
         }
         else if(param1 is Renamed887)
         {
            this.targetingMode = Renamed887(param1).targetingMode;
         }
         else if(param1 is Renamed895)
         {
            _loc2_ = Renamed895(param1);
            if(this.Renamed3399 && this.Renamed3401 && !_loc2_.Renamed896)
            {
               this.Renamed1152();
            }
            this.pause = !Renamed895(param1).enabled;
         }
         else if(param1 is Renamed2630)
         {
            if(this.Renamed3399)
            {
               this.Renamed1152();
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
         if(!this.pause && settingsService.mouseControl && Renamed926.Renamed1024() == Renamed912.Renamed1026)
         {
            if(!this.Renamed3399 && param1)
            {
               this.Renamed1151(true);
               this.Renamed3401 = false;
            }
            else if(this.Renamed3399 && !this.Renamed3401 && !param1)
            {
               this.Renamed1152();
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
         var _loc3_:Renamed717 = Renamed719.Renamed729(param1);
         if(param2)
         {
            if(_loc3_ == Renamed717.SHOT && !this.Renamed3399)
            {
               this.Renamed1151(false);
               this.Renamed3401 = true;
            }
            if(param1 < 256)
            {
               this.Renamed3402[param1] = true;
            }
         }
         else
         {
            if(_loc3_ == Renamed717.SHOT && this.Renamed3399 && this.Renamed3401)
            {
               this.Renamed1152();
            }
            if(param1 < 256)
            {
               this.Renamed3402[param1] = false;
            }
         }
         return true;
      }
      
      public function mouseLocked(param1:Boolean) : void
      {
         if(this.Renamed3399 && this.Renamed3401)
         {
            this.Renamed1152();
         }
      }
   }
}

