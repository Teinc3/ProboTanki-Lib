package §try const return§
{
   import alternativa.tanks.service.settings.keybinding.§&7§;
   import alternativa.tanks.service.settings.keybinding.§>!D§;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import alternativa.tanks.service.settings.keybinding.§for set static§;
   import base.DiscreteSprite;
   import controls.base.LabelBase;
   import controls.base.TankInput;
   import controls.containers.§2H§;
   import flash.events.KeyboardEvent;
   import flash.text.TextFormatAlign;
   import flash.ui.Keyboard;
   
   public class §override set null§ extends DiscreteSprite
   {
      [Inject]
      public static var §5!$§:KeysBindingService;
      
      public static const §'!>§:int = 120;
      
      private var §while package case§:Vector.<TankInput>;
      
      private var §return const function§:§&7§;
      
      public function §override set null§(param1:§&7§, param2:String, param3:int, param4:int)
      {
         var _loc6_:§2H§ = null;
         this.§while package case§ = new Vector.<TankInput>(3,true);
         super();
         this.§return const function§ = param1;
         var _loc5_:int = param4 - 6 * param3 - §'!>§ * 3;
         _loc6_ = new §2H§();
         _loc6_.§!!t§(param3);
         _loc6_.x = _loc5_ + param3;
         var _loc7_:int = 0;
         while(_loc7_ < 3)
         {
            _loc6_.addItem(this.§false var with§(_loc7_));
            _loc7_++;
         }
         var _loc8_:LabelBase;
         (_loc8_ = new LabelBase()).text = param2;
         _loc8_.x = 0;
         _loc8_.y = Math.round((this.§while package case§[0].height - _loc8_.textHeight) * 0.5) - 2;
         addChild(_loc8_);
         addChild(_loc6_);
         §5!$§.addEventListener(§for set static§.§try catch§ + param1.name,this.§while§);
      }
      
      private function §while§(param1:§for set static§) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.§while package case§.length)
         {
            this.§while package case§[_loc2_].value = this.§class package while§(_loc2_);
            _loc2_++;
         }
      }
      
      private function §class package while§(param1:uint) : String
      {
         var _loc2_:uint = §5!$§.§;"R§(this.§return const function§,param1);
         return §5!$§.§get for override§(_loc2_);
      }
      
      public function §,§() : §&7§
      {
         return this.§return const function§;
      }
      
      private function §false var with§(param1:int) : TankInput
      {
         var _loc2_:TankInput = new TankInput();
         _loc2_.addEventListener(KeyboardEvent.KEY_UP,this.onKeyDown);
         _loc2_.maxChars = 1;
         _loc2_.width = §'!>§;
         _loc2_.align = TextFormatAlign.CENTER;
         _loc2_.value = this.§class package while§(param1);
         this.§while package case§[param1] = _loc2_;
         return _loc2_;
      }
      
      private function onKeyDown(param1:KeyboardEvent) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:TankInput = TankInput(param1.currentTarget);
         if(param1.keyCode == Keyboard.BACKSPACE || param1.keyCode == Keyboard.DELETE)
         {
            if(§5!$§.§class package package§(this.§return const function§,§>!D§.§throw set continue§,this.§while package case§.indexOf(_loc3_)))
            {
               _loc3_.value = "";
            }
            else
            {
               _loc3_.value = this.§class package while§(this.§while package case§.indexOf(_loc3_));
            }
            return;
         }
         var _loc4_:String = §5!$§.§get for override§(param1.keyCode);
         if(_loc4_ != "")
         {
            _loc2_ = §5!$§.§class package package§(this.§return const function§,param1.keyCode,this.§while package case§.indexOf(_loc3_));
            _loc3_.value = _loc2_ ? _loc4_ : "";
         }
         else
         {
            _loc3_.value = this.§class package while§(this.§while package case§.indexOf(_loc3_));
         }
      }
      
      public function §^b§() : void
      {
         var _loc1_:Vector.<uint> = §5!$§.§package for catch§(this.§return const function§);
         if(!_loc1_)
         {
            return;
         }
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            this.§while package case§[_loc2_].value = §5!$§.§get for override§(_loc1_[_loc2_]);
            _loc2_++;
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:TankInput = null;
         for each(_loc1_ in this.§while package case§)
         {
            _loc1_.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         }
         this.§while package case§ = null;
         §5!$§.removeEventListener(§for set static§.§try catch§ + this.§return const function§.name,this.§while§);
      }
   }
}

