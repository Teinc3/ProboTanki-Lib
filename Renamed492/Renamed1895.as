package Renamed1804
{
   import controls.Money;
   import controls.Rank;
   import controls.base.LabelBase;
   import controls.rangicons.RangIconSmall;
   import controls.statassets.Renamed4039;
   import controls.statassets.Renamed4040;
   import fl.controls.listClasses.CellRenderer;
   import fl.controls.listClasses.ListData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   
   public class Renamed1895 extends CellRenderer
   {
      protected var nicon:DisplayObject;
      
      private var sicon:DisplayObject;
      
      public function Renamed1895()
      {
         super();
      }
      
      override public function set data(param1:Object) : void
      {
         _data = param1;
         var _loc2_:DisplayObject = new Renamed4040();
         var _loc3_:DisplayObject = new Renamed4039();
         this.nicon = this.myIcon(_data);
         setStyle("upSkin",_loc2_);
         setStyle("downSkin",_loc2_);
         setStyle("overSkin",_loc2_);
         setStyle("selectedUpSkin",_loc3_);
         setStyle("selectedOverSkin",_loc3_);
         setStyle("selectedDownSkin",_loc3_);
      }
      
      override public function set listData(param1:ListData) : void
      {
         _listData = param1;
         label = _listData.label;
         if(this.nicon != null)
         {
            setStyle("icon",this.nicon);
         }
      }
      
      protected function bg(param1:Boolean) : DisplayObject
      {
         return new Sprite();
      }
      
      protected function myIcon(param1:Object) : Sprite
      {
         var _loc2_:Sprite = null;
         var _loc4_:RangIconSmall = null;
         var _loc5_:LabelBase = null;
         var _loc6_:LabelBase = null;
         var _loc7_:LabelBase = null;
         var _loc8_:String = null;
         var _loc9_:TextFormat = null;
         var _loc10_:int = 0;
         _loc2_ = new Sprite();
         var _loc3_:LabelBase = new LabelBase();
         _loc4_ = new RangIconSmall(_data.rank);
         _loc5_ = new LabelBase();
         _loc6_ = new LabelBase();
         _loc3_.autoSize = TextFieldAutoSize.NONE;
         _loc3_.align = TextFormatAlign.RIGHT;
         _loc3_.width = 45;
         _loc3_.text = _data.pos < 0 ? " " : _data.pos;
         _loc2_.addChild(_loc3_);
         if(_data.rank > 0)
         {
            _loc4_.y = 3;
            _loc4_.x = 53;
            _loc2_.addChild(_loc4_);
            _loc5_.text = Rank.name(int(_data.rank));
            _loc5_.x = 63;
            _loc2_.addChild(_loc5_);
         }
         _loc6_.autoSize = TextFieldAutoSize.NONE;
         _loc6_.height = 18;
         _loc6_.text = _data.callsign;
         _loc6_.selectable = true;
         _loc6_.x = 178;
         _loc6_.width = _width - 520;
         _loc2_.addChild(_loc6_);
         _loc10_ = int(_width - 375);
         (_loc7_ = new LabelBase()).autoSize = TextFieldAutoSize.NONE;
         _loc7_.align = TextFormatAlign.RIGHT;
         _loc7_.width = 60;
         _loc7_.x = _loc10_;
         _loc7_.text = _data.score > -1 ? Money.numToString(_data.score,false) : " ";
         _loc2_.addChild(_loc7_);
         _loc10_ += 60;
         (_loc7_ = new LabelBase()).autoSize = TextFieldAutoSize.NONE;
         _loc7_.align = TextFormatAlign.RIGHT;
         _loc7_.width = 70;
         _loc7_.x = _loc10_;
         _loc7_.text = _data.kills > -1 ? Money.numToString(_data.kills,false) : " ";
         _loc2_.addChild(_loc7_);
         _loc10_ += 70;
         (_loc7_ = new LabelBase()).autoSize = TextFieldAutoSize.NONE;
         _loc7_.align = TextFormatAlign.RIGHT;
         _loc7_.width = 50;
         _loc7_.x = _loc10_;
         _loc7_.text = _data.deaths > -1 ? Money.numToString(_data.deaths,false) : " ";
         _loc2_.addChild(_loc7_);
         _loc10_ += 50;
         (_loc7_ = new LabelBase()).autoSize = TextFieldAutoSize.NONE;
         _loc7_.align = TextFormatAlign.RIGHT;
         _loc7_.width = 40;
         _loc7_.x = _loc10_;
         _loc7_.text = _data.ratio > -1 ? Money.numToString(_data.ratio) : (_data.ratio == -11 ? " " : "—");
         _loc2_.addChild(_loc7_);
         _loc10_ += 40;
         (_loc7_ = new LabelBase()).autoSize = TextFieldAutoSize.NONE;
         _loc7_.align = TextFormatAlign.RIGHT;
         _loc7_.width = 65;
         _loc7_.x = _loc10_;
         _loc7_.htmlText = _data.wealth > -1 ? Money.numToString(_data.wealth,false) : " ";
         _loc2_.addChild(_loc7_);
         _loc10_ += 75;
         (_loc7_ = new LabelBase()).autoSize = TextFieldAutoSize.NONE;
         _loc7_.align = TextFormatAlign.RIGHT;
         _loc7_.width = 69;
         _loc7_.x = _loc10_;
         _loc7_.text = _data.rating > -1 ? Money.numToString(_data.rating) : " ";
         _loc2_.addChild(_loc7_);
         return _loc2_;
      }
      
      override protected function drawBackground() : void
      {
         var _loc1_:* = enabled ? mouseState : "disabled";
         if(selected)
         {
            _loc1_ = "selected" + _loc1_.substr(0,1).toUpperCase() + _loc1_.substr(1);
         }
         _loc1_ += "Skin";
         var _loc2_:DisplayObject = background;
         background = getDisplayObjectInstance(getStyleValue(_loc1_));
         addChildAt(background,0);
         if(_loc2_ != null && _loc2_ != background)
         {
            removeChild(_loc2_);
         }
      }
      
      override protected function drawLayout() : void
      {
         super.drawLayout();
      }
      
      override protected function drawIcon() : void
      {
         var _loc1_:DisplayObject = icon;
         var _loc2_:* = enabled ? mouseState : "disabled";
         if(selected)
         {
            _loc2_ = "selected" + _loc2_.substr(0,1).toUpperCase() + _loc2_.substr(1);
         }
         _loc2_ += "Icon";
         var _loc3_:Object = getStyleValue(_loc2_);
         if(_loc3_ == null)
         {
            _loc3_ = getStyleValue("icon");
         }
         if(_loc3_ != null)
         {
            icon = getDisplayObjectInstance(_loc3_);
         }
         if(icon != null)
         {
            addChildAt(icon,1);
         }
         if(_loc1_ != null && _loc1_ != icon && _loc1_.parent == this)
         {
            removeChild(_loc1_);
         }
      }
   }
}

