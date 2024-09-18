package controls
{
   import controls.base.LabelBase;
   import controls.buttons.ButtonStates;
   import controls.buttons.h50px.GreyBigButton;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   
   public class BigButton1 extends GreyBigButton
   {
      protected var _info:LabelBase;
      
      protected var _icon:Bitmap;
      
      protected var _width:int = 100;
      
      public function BigButton1()
      {
         this._info = new LabelBase();
         this._icon = new Bitmap();
         super();
         this.configUI();
         enabled = true;
         tabEnabled = false;
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = int(param1);
         super.width = this._width;
         this._info.width = this._width - 4;
         if(this._icon.bitmapData != null)
         {
            this._icon.x = this._width - this._icon.width - 6;
            this._icon.y = int(25 - this._icon.height / 2);
            _label.width = this._width - 4 - this._icon.width;
         }
      }
      
      public function set info(param1:String) : void
      {
         this._info.htmlText = param1;
      }
      
      public function set icon(param1:BitmapData) : void
      {
         if(param1 != null)
         {
            this._icon.visible = true;
            _label.width = this._width - 4 - this._icon.width;
         }
         else
         {
            _label.width = this._width - 4;
            this._icon.visible = false;
         }
         this._icon.bitmapData = param1;
         this.width = this._width;
      }
      
      private function configUI() : void
      {
         addChild(this._icon);
         this._info.align = TextFormatAlign.CENTER;
         this._info.autoSize = TextFieldAutoSize.NONE;
         this._info.selectable = false;
         this._info.x = 2;
         this._info.y = 24;
         this._info.height = 20;
         this._info.mouseEnabled = false;
         this._info.filters = [new DropShadowFilter(1,45,0,0.7,1,1,1)];
         this.width = 120;
      }
      
      override protected function onStateChanged() : void
      {
         super.onStateChanged();
         var _loc1_:int = getState() == ButtonStates.DOWN ? int(1) : int(0);
         this._info.y = 24 + _loc1_;
         this._icon.y = int(25 - this._icon.height / 2) + _loc1_;
      }
   }
}

