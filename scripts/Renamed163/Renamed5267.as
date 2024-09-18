package Renamed4543
{
   import Renamed479.Renamed5258;
   import Renamed479.Renamed915;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.Renamed775;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.services.targeting.Renamed1497;
   import alternativa.tanks.services.targeting.TargetingInputManager;
   import alternativa.tanks.utils.MathUtils;
   import flash.events.Event;
   
   public class Renamed4544 implements Renamed5258, Renamed1497
   {
      [Inject]
      public static var Renamed4734:TargetingInputManager;
      
      [Inject]
      public static var settingsService:ISettingsService;
      
      [Inject]
      public static var display:IDisplay;
      
      private static const Renamed5259:Number = 0.0001;
      
      private static var mouseSensitivity:int = 0;
      
      protected var Renamed991:Renamed915;
      
      private var Renamed5260:Number;
      
      private var Renamed962:Number;
      
      private var Renamed5261:Boolean;
      
      public function Renamed4544(param1:Renamed915)
      {
         super();
         this.Renamed991 = param1;
         this.Renamed5260 = 0;
         mouseSensitivity = settingsService.mouseSensitivity;
      }
      
      public function mouseRelativeMovement(param1:Number, param2:Number) : void
      {
         this.Renamed5260 -= param1 * mouseSensitivity * Renamed5259;
         this.Renamed5260 = MathUtils.clampAngle(this.Renamed5260);
      }
      
      public function keyboardButton(param1:uint, param2:Boolean) : Boolean
      {
         return true;
      }
      
      public function tick(param1:Number) : void
      {
         var _loc2_:Tank = Renamed775.Renamed824.tank;
         this.Renamed962 = _loc2_.Renamed1028();
         if(!this.Renamed5261)
         {
            this.Renamed5262();
         }
         this.Renamed991.Renamed5263(this.Renamed5260);
      }
      
      protected function Renamed5262() : void
      {
         this.Renamed991.Renamed5262(this.Renamed5260 - this.Renamed962);
      }
      
      public function enter() : void
      {
         Renamed4734.addListener(this);
         display.stage.addEventListener(Event.MOUSE_LEAVE,this.Renamed3406);
         mouseSensitivity = settingsService.mouseSensitivity;
         var _loc1_:Tank = Renamed775.Renamed824.tank;
         this.Renamed962 = _loc1_.Renamed1028();
         this.Renamed5260 = MathUtils.clampAngle(this.Renamed962 + this.Renamed5264());
         this.Renamed5262();
         this.Renamed991.Renamed5263(this.Renamed5260);
         this.Renamed5261 = false;
      }
      
      protected function Renamed5264() : Number
      {
         return this.Renamed991.Renamed1013();
      }
      
      public function exit() : void
      {
         display.stage.removeEventListener(Event.MOUSE_LEAVE,this.Renamed3406);
         Renamed4734.removeListener(this);
         this.Renamed991.Renamed1084();
         this.Renamed991.Renamed5265();
      }
      
      private function Renamed3406(param1:Event) : void
      {
         this.Renamed5261 = false;
      }
      
      public function mouseAbsoluteMovement(param1:Number, param2:Number) : void
      {
      }
      
      public function mouseLeftButton(param1:Boolean, param2:Boolean) : Boolean
      {
         return true;
      }
      
      public function mouseWheel(param1:int) : void
      {
      }
      
      public function mouseRightButton(param1:Boolean, param2:Boolean) : Boolean
      {
         this.Renamed5261 = param1;
         this.Renamed991.Renamed5266();
         return true;
      }
      
      public function mouseLocked(param1:Boolean) : void
      {
      }
   }
}

