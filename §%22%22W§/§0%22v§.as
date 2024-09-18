package §""W§
{
   import §]#R§.§catch const var§;
   import §]#R§.§if set case§;
   import §]#R§.§try set for§;
   import alternativa.tanks.service.settings.keybinding.§&7§;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import alternativa.tanks.services.targeting.§9#j§;
   import alternativa.tanks.services.targeting.TargetingInputManager;
   import alternativa.tanks.services.targeting.TargetingModeService;
   
   public class §0"v§ implements §if set case§, §9#j§
   {
      [Inject]
      public static var §default package import§:TargetingModeService;
      
      [Inject]
      public static var §9!U§:TargetingInputManager;
      
      [Inject]
      public static var §5!$§:KeysBindingService;
      
      protected var §finally for var§:§try set for§;
      
      protected var §if package static§:§catch const var§;
      
      protected var §-Z§:§catch const var§;
      
      public function §0"v§(param1:§try set for§)
      {
         super();
         this.§finally for var§ = param1;
         this.§`!G§(§catch const var§.§3!?§);
         §default package import§.§`!G§(§catch const var§.§3!?§);
      }
      
      public function keyboardButton(param1:uint, param2:Boolean) : Boolean
      {
         var _loc3_:§&7§ = §5!$§.§&!<§(param1);
         if(!_loc3_)
         {
            return true;
         }
         this.§finally for var§.§package catch package§(_loc3_.value,param2);
         this.§"#]§(_loc3_,param2);
         return true;
      }
      
      protected function §"#]§(param1:§&7§, param2:Boolean) : void
      {
         switch(param1)
         {
            case this.§if package static§.§,#$§:
               this.§finally for var§.rotateLeft(param2);
               break;
            case this.§if package static§.§package const class§:
               this.§finally for var§.rotateRight(param2);
               break;
            case this.§if package static§.§break package for§:
               this.§finally for var§.§case var each§(param2);
               break;
            case this.§if package static§.§9"y§:
               this.§finally for var§.§&2§(param2);
               break;
            case this.§if package static§.§with package throw§:
               this.§finally for var§.center(param2);
         }
      }
      
      public function enter() : void
      {
         §9!U§.addListener(this);
         if(this.§-Z§ == null)
         {
            this.§-Z§ = §default package import§.§%"D§();
            §default package import§.§`!G§(this.§if package static§);
         }
         this.§6"O§();
      }
      
      private function §6"O§() : void
      {
         this.§2"$§(this.§if package static§.§with package throw§);
         this.§2"$§(this.§if package static§.§9"y§);
         this.§2"$§(this.§if package static§.§,#$§);
         this.§2"$§(this.§if package static§.§package const class§);
         this.§2"$§(this.§if package static§.§break package for§);
      }
      
      private function §2"$§(param1:§&7§) : void
      {
         if(!param1)
         {
            return;
         }
         if(this.§finally for var§.§function const set§(param1.value))
         {
            this.§"#]§(param1,true);
         }
      }
      
      public function exit() : void
      {
         §9!U§.removeListener(this);
         if(this.§-Z§ != null)
         {
            §default package import§.§`!G§(this.§-Z§);
            this.§-Z§ = null;
         }
      }
      
      protected function §`!G§(param1:§catch const var§) : void
      {
         this.§if package static§ = param1;
      }
      
      public function tick(param1:Number) : void
      {
      }
      
      public function mouseAbsoluteMovement(param1:Number, param2:Number) : void
      {
      }
      
      public function mouseRelativeMovement(param1:Number, param2:Number) : void
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
         return true;
      }
      
      public function mouseLocked(param1:Boolean) : void
      {
      }
   }
}

