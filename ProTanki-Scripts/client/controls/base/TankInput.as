package controls.base
{
   import base.DiscreteSprite;
   import controls.TextFieldUtf8;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.events.MouseEvent;
   import flash.system.Capabilities;
   import flash.text.AntiAliasType;
   import flash.text.GridFitType;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import fonts.TanksFontService;
   import utils.FontParamsUtil;
   
   public class TankInput extends DiscreteSprite
   {
      private static const Renamed3967:Class = Renamed3968;
      
      private static const Renamed3969:Class = Renamed3970;
      
      private static const leftClass:Class = Renamed3971;
      
      private static const Renamed3972:Class = Renamed3973;
      
      private static const rightClass:Class = Renamed3974;
      
      private static const Renamed3975:Class = Renamed3976;
      
      public static const Renamed3977:int = 5;
      
      public static const Renamed3978:int = 30;
      
      public static const Renamed3979:int = 212;
      
      private static const Renamed3980:int = 3;
      
      private static const Renamed3981:int = 7;
      
      private static const Renamed3982:RegExp = /^(\w*) (\d*),(\d*),(\d*),(\d*)$/;
      
      public var textField:TextField;
      
      private var _hidden:Boolean;
      
      private var _valid:Boolean = true;
      
      private var _width:int;
      
      private var _height:int;
      
      public function TankInput()
      {
         this.format = TanksFontService.getTextFormat(12);
         this.bg = new DiscreteSprite();
         this.Renamed3983 = new Shape();
         this.Renamed3984 = new Shape();
         this.Renamed3985 = new Shape();
         this.bmpLeft = new leftClass().bitmapData;
         this.bmpCenter = new Renamed3967().bitmapData;
         this.bmpRight = new rightClass().bitmapData;
         this.bmpLeftWrong = new Renamed3972().bitmapData;
         this.bmpCenterWrong = new Renamed3969().bitmapData;
         this.bmpRightWrong = new Renamed3975().bitmapData;
         super();
         addChild(this.bg);
         this.bg.addChild(this.Renamed3983);
         this.bg.addChild(this.Renamed3984);
         this.bg.addChild(this.Renamed3985);
         this.Renamed3986();
         this.height = Renamed3978;
         this.width = Renamed3979;
      }
      
      private function Renamed3986() : void
      {
         var _loc1_:String = Capabilities.version;
         var _loc2_:Object = Renamed3982.exec(_loc1_);
         if(_loc2_ != null && Number(_loc2_[2] + "." + _loc2_[3]) < 10.1)
         {
            this.textField = new TextFieldUtf8();
         }
         else
         {
            this.textField = new TextField();
         }
         this.textField.defaultTextFormat = this.format;
         this.textField.antiAliasType = AntiAliasType.ADVANCED;
         this.textField.gridFitType = GridFitType.PIXEL;
         this.textField.embedFonts = TanksFontService.isEmbedFonts();
         this.textField.type = TextFieldType.INPUT;
         this.textField.x = Renamed3980;
         this.textField.y = Renamed3981;
         this.Renamed3987();
         this.textField.sharpness = FontParamsUtil.SHARPNESS_TANK_INPUT_BASE;
         this.textField.thickness = FontParamsUtil.THICKNESS_TANK_INPUT_BASE;
         this.textField.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         this.textField.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         addChild(this.textField);
      }
      
      private function Renamed3987() : void
      {
         this.textField.height = this._height - 2 * Renamed3977;
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         Mouse.cursor = MouseCursor.IBEAM;
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
         Mouse.cursor = MouseCursor.AUTO;
      }
      
      public function set enable(param1:Boolean) : void
      {
         this.textField.type = param1 ? TextFieldType.INPUT : TextFieldType.DYNAMIC;
         this.textField.selectable = param1;
         this.textField.mouseEnabled = param1;
         this.textField.mouseWheelEnabled = param1;
         this.textField.tabEnabled = param1;
      }
      
      override public function set x(param1:Number) : void
      {
         super.x = int(param1);
      }
      
      override public function set y(param1:Number) : void
      {
         super.y = int(param1);
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = Math.ceil(param1);
         this.textField.width = this._width - 6;
         this.draw();
      }
      
      override public function set height(param1:Number) : void
      {
         this._height = Math.ceil(param1);
         this.Renamed3987();
         this.draw();
      }
      
      public function set align(param1:String) : void
      {
         this.format.align = param1;
         this.Renamed3988();
      }
      
      private function Renamed3988() : void
      {
         this.textField.defaultTextFormat = this.format;
         this.textField.setTextFormat(this.format);
      }
      
      public function clear() : void
      {
         this.textField.text = "";
         this.validValue = true;
      }
      
      override public function set tabIndex(param1:int) : void
      {
         this.textField.tabIndex = param1;
      }
      
      public function set restrict(param1:String) : void
      {
         this.textField.restrict = param1;
      }
      
      public function set maxChars(param1:int) : void
      {
         this.textField.maxChars = param1;
      }
      
      public function get value() : String
      {
         return this.textField.text;
      }
      
      public function set value(param1:String) : void
      {
         this.textField.text = param1;
      }
      
      public function set hidden(param1:Boolean) : void
      {
         this._hidden = param1;
         this.textField.displayAsPassword = this._hidden;
      }
      
      public function get hidden() : Boolean
      {
         return this._hidden;
      }
      
      public function set validValue(param1:Boolean) : void
      {
         this._valid = param1;
         this.draw();
      }
      
      public function get validValue() : Boolean
      {
         return this._valid;
      }
      
      private function draw() : void
      {
         var _loc1_:Graphics = this.Renamed3983.graphics;
         _loc1_.clear();
         _loc1_.beginBitmapFill(this._valid ? this.bmpLeft : this.bmpLeftWrong);
         _loc1_.drawRect(0,0,Renamed3977,this._height);
         _loc1_.endFill();
         this.Renamed3983.x = 0;
         this.Renamed3983.y = 0;
         var _loc2_:Graphics = this.Renamed3984.graphics;
         _loc2_.clear();
         _loc2_.beginBitmapFill(this._valid ? this.bmpCenter : this.bmpCenterWrong);
         _loc2_.drawRect(0,0,this._width - 2 * Renamed3977,this._height);
         _loc2_.endFill();
         this.Renamed3984.x = Renamed3977;
         this.Renamed3984.y = 0;
         var _loc3_:Graphics = this.Renamed3985.graphics;
         _loc3_.clear();
         _loc3_.beginBitmapFill(this._valid ? this.bmpRight : this.bmpRightWrong);
         _loc3_.drawRect(0,0,Renamed3977,this._height);
         _loc3_.endFill();
         this.Renamed3985.x = this._width - Renamed3977;
         this.Renamed3985.y = 0;
      }
   }
}

