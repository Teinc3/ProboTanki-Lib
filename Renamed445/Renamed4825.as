package Renamed445
{
   import alternativa.tanks.service.settings.keybinding.Renamed717;
   import alternativa.tanks.service.settings.keybinding.Renamed575;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import alternativa.tanks.service.settings.keybinding.Renamed3777;
   import base.DiscreteSprite;
   import controls.base.LabelBase;
   import controls.base.TankInput;
   import controls.containers.Renamed1982;
   import flash.events.KeyboardEvent;
   import flash.text.TextFormatAlign;
   import flash.ui.Keyboard;
   
   public class Renamed4825 extends DiscreteSprite
   {
      [Inject]
      public static var Renamed719:KeysBindingService;
      
      public static const Renamed8972:int = 120;
      
      private var Renamed8973:Vector.<TankInput>;
      
      private var Renamed3784:Renamed717;
      
      public function Renamed4825(param1:Renamed717, param2:String, param3:int, param4:int)
      {
         var _loc6_:Renamed1982 = null;
         this.Renamed8973 = new Vector.<TankInput>(3,true);
         super();
         this.Renamed3784 = param1;
         var _loc5_:int = param4 - 6 * param3 - Renamed8972 * 3;
         _loc6_ = new Renamed1982();
         _loc6_.Renamed1987(param3);
         _loc6_.x = _loc5_ + param3;
         var _loc7_:int = 0;
         while(_loc7_ < 3)
         {
            _loc6_.addItem(this.Renamed8974(_loc7_));
            _loc7_++;
         }
         var _loc8_:LabelBase;
         (_loc8_ = new LabelBase()).text = param2;
         _loc8_.x = 0;
         _loc8_.y = Math.round((this.Renamed8973[0].height - _loc8_.textHeight) * 0.5) - 2;
         addChild(_loc8_);
         addChild(_loc6_);
         Renamed719.addEventListener(Renamed3777.Renamed3778 + param1.name,this.Renamed8975);
      }
      
      private function Renamed8975(param1:Renamed3777) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.Renamed8973.length)
         {
            this.Renamed8973[_loc2_].value = this.Renamed8976(_loc2_);
            _loc2_++;
         }
      }
      
      private function Renamed8976(param1:uint) : String
      {
         var _loc2_:uint = Renamed719.Renamed3757(this.Renamed3784,param1);
         return Renamed719.Renamed3760(_loc2_);
      }
      
      public function Renamed35() : Renamed717
      {
         return this.Renamed3784;
      }
      
      private function Renamed8974(param1:int) : TankInput
      {
         var _loc2_:TankInput = new TankInput();
         _loc2_.addEventListener(KeyboardEvent.KEY_UP,this.onKeyDown);
         _loc2_.maxChars = 1;
         _loc2_.width = Renamed8972;
         _loc2_.align = TextFormatAlign.CENTER;
         _loc2_.value = this.Renamed8976(param1);
         this.Renamed8973[param1] = _loc2_;
         return _loc2_;
      }
      
      private function onKeyDown(param1:KeyboardEvent) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:TankInput = TankInput(param1.currentTarget);
         if(param1.keyCode == Keyboard.BACKSPACE || param1.keyCode == Keyboard.DELETE)
         {
            if(Renamed719.Renamed3756(this.Renamed3784,Renamed575.Renamed3763,this.Renamed8973.indexOf(_loc3_)))
            {
               _loc3_.value = "";
            }
            else
            {
               _loc3_.value = this.Renamed8976(this.Renamed8973.indexOf(_loc3_));
            }
            return;
         }
         var _loc4_:String = Renamed719.Renamed3760(param1.keyCode);
         if(_loc4_ != "")
         {
            _loc2_ = Renamed719.Renamed3756(this.Renamed3784,param1.keyCode,this.Renamed8973.indexOf(_loc3_));
            _loc3_.value = _loc2_ ? _loc4_ : "";
         }
         else
         {
            _loc3_.value = this.Renamed8976(this.Renamed8973.indexOf(_loc3_));
         }
      }
      
      public function Renamed8970() : void
      {
         var _loc1_:Vector.<uint> = Renamed719.Renamed3758(this.Renamed3784);
         if(!_loc1_)
         {
            return;
         }
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            this.Renamed8973[_loc2_].value = Renamed719.Renamed3760(_loc1_[_loc2_]);
            _loc2_++;
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:TankInput = null;
         for each(_loc1_ in this.Renamed8973)
         {
            _loc1_.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         }
         this.Renamed8973 = null;
         Renamed719.removeEventListener(Renamed3777.Renamed3778 + this.Renamed3784.name,this.Renamed8975);
      }
   }
}

