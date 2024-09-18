package controls.dropdownlist
{
   import alternativa.tanks.gui.CrystalLabel;
   import assets.combo.ComboListOverState;
   import controls.ButtonState;
   import controls.base.LabelBase;
   import controls.rangicons.RangIconSmall;
   import fl.controls.listClasses.CellRenderer;
   import fl.controls.listClasses.ListData;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.text.TextFieldAutoSize;
   import forms.ColorConstants;
   
   public class ComboR extends CellRenderer
   {
      private var nicon:DisplayObject;
      
      private var normalStyle:Bitmap;
      
      private var overStyle:ComboListOverState;
      
      public function ComboR()
      {
         this.overStyle = new ComboListOverState();
         super();
      }
      
      override public function set data(param1:Object) : void
      {
         var _loc2_:ButtonState = null;
         this.normalStyle = new Bitmap(new BitmapData(1,1,true,0));
         _data = param1;
         setStyle("upSkin",this.normalStyle);
         setStyle("downSkin",this.overStyle);
         setStyle("overSkin",this.overStyle);
         setStyle("selectedUpSkin",this.normalStyle);
         setStyle("selectedOverSkin",this.overStyle);
         setStyle("selectedDownSkin",this.overStyle);
      }
      
      private function myIcon(param1:Object) : Sprite
      {
         var _loc2_:LabelBase = null;
         var _loc5_:CrystalLabel = null;
         _loc2_ = null;
         var _loc3_:RangIconSmall = null;
         var _loc4_:Sprite = new Sprite();
         _loc2_ = new LabelBase();
         _loc2_.autoSize = TextFieldAutoSize.NONE;
         _loc2_.color = 16777215;
         _loc2_.alpha = param1.rang > 0 ? Number(0.5) : Number(1);
         _loc2_.text = param1.gameName;
         _loc2_.height = 20;
         _loc2_.width = _width - 20;
         _loc2_.x = 12;
         _loc2_.y = 0;
         if(param1.rang > 0)
         {
            _loc3_ = new RangIconSmall(param1.rang);
            _loc3_.x = -2;
            _loc3_.y = 2;
            _loc4_.addChild(_loc3_);
         }
         _loc4_.addChild(_loc2_);
         if(param1.additionalCrystalsPercent > 0)
         {
            _loc2_.color = ColorConstants.SUSPICIOUS;
            _loc5_ = new CrystalLabel();
            _loc5_.setText("+" + param1.additionalCrystalsPercent + "%");
            _loc5_.x = _loc2_.x + _loc2_.textWidth + 4;
            _loc4_.addChild(_loc5_);
         }
         return _loc4_;
      }
      
      override public function set listData(param1:ListData) : void
      {
         _listData = param1;
         label = "";
         this.nicon = this.myIcon(_data);
         if(this.nicon != null)
         {
            setStyle("icon",this.nicon);
         }
      }
      
      override protected function drawLayout() : void
      {
         super.drawLayout();
         background.width = width - 6;
         background.height = height;
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

