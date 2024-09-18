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
      private static const §final var var§:Class = §@%§;
      
      private static const §try var class§:Class = §else set package§;
      
      private static const leftClass:Class = §,"x§;
      
      private static const §implements for each§:Class = §2j§;
      
      private static const rightClass:Class = §var for for§;
      
      private static const §set catch dynamic§:Class = §9"V§;
      
      public static const §5Y§:int = 5;
      
      public static const §?##§:int = 30;
      
      public static const §get package null§:int = 212;
      
      private static const §-"m§:int = 3;
      
      private static const §3#V§:int = 7;
      
      private static const §continue for get§:RegExp = /^(\w*) (\d*),(\d*),(\d*),(\d*)$/;
      
      public var textField:TextField;
      
      private var _hidden:Boolean;
      
      private var _valid:Boolean = true;
      
      private var _width:int;
      
      private var _height:int;
      
      public function TankInput()
      {
         this.format = TanksFontService.getTextFormat(12);
         this.bg = new DiscreteSprite();
         this.§while package try§ = new Shape();
         this.§[#<§ = new Shape();
         this.§'#"§ = new Shape();
         this.bmpLeft = new leftClass().bitmapData;
         this.bmpCenter = new §final var var§().bitmapData;
         this.bmpRight = new rightClass().bitmapData;
         this.bmpLeftWrong = new §implements for each§().bitmapData;
         this.bmpCenterWrong = new §try var class§().bitmapData;
         this.bmpRightWrong = new §set catch dynamic§().bitmapData;
         super();
         addChild(this.bg);
         this.bg.addChild(this.§while package try§);
         this.bg.addChild(this.§[#<§);
         this.bg.addChild(this.§'#"§);
         this.§return var true§();
         this.height = §?##§;
         this.width = §get package null§;
      }
      
      private function §return var true§() : void
      {
         var _loc1_:String = Capabilities.version;
         var _loc2_:Object = §continue for get§.exec(_loc1_);
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
         this.textField.x = §-"m§;
         this.textField.y = §3#V§;
         this.§native const if§();
         this.textField.sharpness = FontParamsUtil.SHARPNESS_TANK_INPUT_BASE;
         this.textField.thickness = FontParamsUtil.THICKNESS_TANK_INPUT_BASE;
         this.textField.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         this.textField.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         addChild(this.textField);
      }
      
      private function §native const if§() : void
      {
         this.textField.height = this._height - 2 * §5Y§;
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
         this.§native const if§();
         this.draw();
      }
      
      public function set align(param1:String) : void
      {
         this.format.align = param1;
         this.§&!0§();
      }
      
      private function §&!0§() : void
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
         var _loc1_:Graphics = this.§while package try§.graphics;
         _loc1_.clear();
         _loc1_.beginBitmapFill(this._valid ? this.bmpLeft : this.bmpLeftWrong);
         _loc1_.drawRect(0,0,§5Y§,this._height);
         _loc1_.endFill();
         this.§while package try§.x = 0;
         this.§while package try§.y = 0;
         var _loc2_:Graphics = this.§[#<§.graphics;
         _loc2_.clear();
         _loc2_.beginBitmapFill(this._valid ? this.bmpCenter : this.bmpCenterWrong);
         _loc2_.drawRect(0,0,this._width - 2 * §5Y§,this._height);
         _loc2_.endFill();
         this.§[#<§.x = §5Y§;
         this.§[#<§.y = 0;
         var _loc3_:Graphics = this.§'#"§.graphics;
         _loc3_.clear();
         _loc3_.beginBitmapFill(this._valid ? this.bmpRight : this.bmpRightWrong);
         _loc3_.drawRect(0,0,§5Y§,this._height);
         _loc3_.endFill();
         this.§'#"§.x = this._width - §5Y§;
         this.§'#"§.y = 0;
      }
   }
}

