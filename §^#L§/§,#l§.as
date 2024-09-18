package §^#l§
{
   import controls.base.BigButtonBase;
   import controls.buttons.ButtonStates;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   
   public class §,#l§ extends BigButtonBase
   {
      private static const §-#C§:Class = §continue for import§;
      
      private static const green:BitmapData = new §-#C§().bitmapData;
      
      private var §try package continue§:int;
      
      public function §,#l§()
      {
         var _loc1_:Bitmap = null;
         super();
         _label.size = 12;
         _label.color = 52238;
         _label.multiline = true;
         _label.align = TextFormatAlign.LEFT;
         _label.autoSize = TextFieldAutoSize.LEFT;
         _label.wordWrap = true;
         this.width = 156;
         _loc1_ = new Bitmap(green);
         _loc1_.y = 7;
         _loc1_.x = 7;
         addChildAt(_loc1_,getChildIndex(_innerLayer));
      }
      
      override public function set label(param1:String) : void
      {
         super.label = param1;
         this.§try package continue§ = 24 - _label.textHeight / 2;
         this.width = _width;
      }
      
      override public function set width(param1:Number) : void
      {
         super.width = param1;
         if(_icon.bitmapData != null)
         {
            _icon.x = 12;
            _icon.y = int(27 - _icon.height / 2);
            _label.width = _width - 8 - _icon.width;
            _label.x = _icon.width + 14;
            _label.y = this.§try package continue§;
         }
      }
      
      override protected function onStateChanged() : void
      {
         super.onStateChanged();
         var _loc1_:int = 0;
         if(getState() == ButtonStates.DOWN)
         {
            _loc1_ = 1;
         }
         _label.y = this.§try package continue§ + _loc1_;
         if(_icon != null)
         {
            _icon.y = int(27 - _icon.height / 2) + _loc1_;
         }
      }
   }
}

