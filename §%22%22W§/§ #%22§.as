package §""W§
{
   import §]#R§.§if set case§;
   import §]#R§.§try set for§;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.§7!9§;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.services.targeting.§9#j§;
   import alternativa.tanks.services.targeting.TargetingInputManager;
   import alternativa.tanks.utils.MathUtils;
   import flash.events.Event;
   
   public class § #"§ implements §if set case§, §9#j§
   {
      [Inject]
      public static var §6">§:TargetingInputManager;
      
      [Inject]
      public static var settingsService:ISettingsService;
      
      [Inject]
      public static var display:IDisplay;
      
      private static const §set set const§:Number = 0.0001;
      
      private static var mouseSensitivity:int = 0;
      
      protected var §finally for var§:§try set for§;
      
      private var §`"2§:Number;
      
      private var §3#M§:Number;
      
      private var §class var const§:Boolean;
      
      public function § #"§(param1:§try set for§)
      {
         super();
         this.§finally for var§ = param1;
         this.§`"2§ = 0;
         mouseSensitivity = settingsService.mouseSensitivity;
      }
      
      public function mouseRelativeMovement(param1:Number, param2:Number) : void
      {
         this.§`"2§ -= param1 * mouseSensitivity * §set set const§;
         this.§`"2§ = MathUtils.clampAngle(this.§`"2§);
      }
      
      public function keyboardButton(param1:uint, param2:Boolean) : Boolean
      {
         return true;
      }
      
      public function tick(param1:Number) : void
      {
         var _loc2_:Tank = §7!9§.§8"-§.tank;
         this.§3#M§ = _loc2_.§each package const§();
         if(!this.§class var const§)
         {
            this.§package var set§();
         }
         this.§finally for var§.§;!r§(this.§`"2§);
      }
      
      protected function §package var set§() : void
      {
         this.§finally for var§.§package var set§(this.§`"2§ - this.§3#M§);
      }
      
      public function enter() : void
      {
         §6">§.addListener(this);
         display.stage.addEventListener(Event.MOUSE_LEAVE,this.§%!s§);
         mouseSensitivity = settingsService.mouseSensitivity;
         var _loc1_:Tank = §7!9§.§8"-§.tank;
         this.§3#M§ = _loc1_.§each package const§();
         this.§`"2§ = MathUtils.clampAngle(this.§3#M§ + this.§9"+§());
         this.§package var set§();
         this.§finally for var§.§;!r§(this.§`"2§);
         this.§class var const§ = false;
      }
      
      protected function §9"+§() : Number
      {
         return this.§finally for var§.§do var§();
      }
      
      public function exit() : void
      {
         display.stage.removeEventListener(Event.MOUSE_LEAVE,this.§%!s§);
         §6">§.removeListener(this);
         this.§finally for var§.§ !n§();
         this.§finally for var§.§if const native§();
      }
      
      private function §%!s§(param1:Event) : void
      {
         this.§class var const§ = false;
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
         this.§class var const§ = param1;
         this.§finally for var§.§get set false§();
         return true;
      }
      
      public function mouseLocked(param1:Boolean) : void
      {
      }
   }
}

