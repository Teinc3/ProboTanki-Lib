package Renamed4543
{
   import Renamed479.Renamed3840;
   import Renamed479.Renamed5258;
   import Renamed479.Renamed915;
   import alternativa.tanks.service.settings.keybinding.Renamed717;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import alternativa.tanks.services.targeting.Renamed1497;
   import alternativa.tanks.services.targeting.TargetingInputManager;
   import alternativa.tanks.services.targeting.TargetingModeService;
   
   public class Renamed4545 implements Renamed5258, Renamed1497
   {
      [Inject]
      public static var Renamed926:TargetingModeService;
      
      [Inject]
      public static var Renamed1499:TargetingInputManager;
      
      [Inject]
      public static var Renamed719:KeysBindingService;
      
      protected var Renamed991:Renamed915;
      
      protected var Renamed5268:Renamed3840;
      
      protected var Renamed5269:Renamed3840;
      
      public function Renamed4545(param1:Renamed915)
      {
         super();
         this.Renamed991 = param1;
         this.Renamed3841(Renamed3840.Renamed5270);
         Renamed926.Renamed3841(Renamed3840.Renamed5270);
      }
      
      public function keyboardButton(param1:uint, param2:Boolean) : Boolean
      {
         var _loc3_:Renamed717 = Renamed719.Renamed729(param1);
         if(!_loc3_)
         {
            return true;
         }
         this.Renamed991.Renamed5271(_loc3_.value,param2);
         this.Renamed5272(_loc3_,param2);
         return true;
      }
      
      protected function Renamed5272(param1:Renamed717, param2:Boolean) : void
      {
         switch(param1)
         {
            case this.Renamed5268.Renamed3878:
               this.Renamed991.rotateLeft(param2);
               break;
            case this.Renamed5268.Renamed3879:
               this.Renamed991.rotateRight(param2);
               break;
            case this.Renamed5268.Renamed5273:
               this.Renamed991.Renamed5274(param2);
               break;
            case this.Renamed5268.Renamed5275:
               this.Renamed991.Renamed5276(param2);
               break;
            case this.Renamed5268.Renamed3877:
               this.Renamed991.center(param2);
         }
      }
      
      public function enter() : void
      {
         Renamed1499.addListener(this);
         if(this.Renamed5269 == null)
         {
            this.Renamed5269 = Renamed926.Renamed3842();
            Renamed926.Renamed3841(this.Renamed5268);
         }
         this.Renamed5277();
      }
      
      private function Renamed5277() : void
      {
         this.Renamed5278(this.Renamed5268.Renamed3877);
         this.Renamed5278(this.Renamed5268.Renamed5275);
         this.Renamed5278(this.Renamed5268.Renamed3878);
         this.Renamed5278(this.Renamed5268.Renamed3879);
         this.Renamed5278(this.Renamed5268.Renamed5273);
      }
      
      private function Renamed5278(param1:Renamed717) : void
      {
         if(!param1)
         {
            return;
         }
         if(this.Renamed991.Renamed5279(param1.value))
         {
            this.Renamed5272(param1,true);
         }
      }
      
      public function exit() : void
      {
         Renamed1499.removeListener(this);
         if(this.Renamed5269 != null)
         {
            Renamed926.Renamed3841(this.Renamed5269);
            this.Renamed5269 = null;
         }
      }
      
      protected function Renamed3841(param1:Renamed3840) : void
      {
         this.Renamed5268 = param1;
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

