package alternativa.tanks.view.battleinfo
{
   import assets.cellrenderer.battlelist.CellBlue;
   import assets.cellrenderer.battlelist.CellNormalUp;
   import assets.cellrenderer.battlelist.CellRed;
   import controls.ButtonState;
   import controls.base.LabelBase;
   import fl.controls.listClasses.CellRenderer;
   import fl.controls.listClasses.ListData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import fonts.TanksFontService;
   import forms.ColorConstants;
   import forms.userlabel.UserLabel;
   
   public class TeamListRenderer extends CellRenderer
   {
      private var format:TextFormat;
      
      private var nicon:DisplayObject;
      
      private var greenStyle:ButtonState;
      
      private var redStyle:ButtonState;
      
      private var BlueStyle:ButtonState;
      
      public function TeamListRenderer()
      {
         this.format = TanksFontService.getTextFormat(13);
         this.greenStyle = new CellNormalUp();
         this.redStyle = new CellRed();
         this.BlueStyle = new CellBlue();
         super();
         this.format.color = 16777215;
         setStyle("textFormat",this.format);
         setStyle("embedFonts",TanksFontService.isEmbedFonts());
      }
      
      override public function set data(param1:Object) : void
      {
         var _loc2_:ButtonState = null;
         _data = param1;
         this.mouseChildren = true;
         this.buttonMode = this.useHandCursor = false;
         this.nicon = this.myIcon(_data);
         switch(_data.style)
         {
            case "green":
               _loc2_ = this.greenStyle;
               break;
            case "red":
               _loc2_ = this.redStyle;
               break;
            case "blue":
               _loc2_ = this.BlueStyle;
         }
         setStyle("upSkin",_loc2_);
         setStyle("downSkin",_loc2_);
         setStyle("overSkin",_loc2_);
         setStyle("selectedUpSkin",_loc2_);
         setStyle("selectedOverSkin",_loc2_);
         setStyle("selectedDownSkin",_loc2_);
      }
      
      private function myIcon(param1:Object) : Sprite
      {
         var _loc5_:Sprite = null;
         var _loc2_:UserLabel = null;
         var _loc3_:LabelBase = null;
         var _loc4_:LabelBase = null;
         if(_width < 0)
         {
            _width = 20;
         }
         _loc5_ = new Sprite();
         if(param1.id != null)
         {
            _loc2_ = new UserLabel(param1.id);
            if(param1.suspicious)
            {
               _loc2_.setUidColor(ColorConstants.SUSPICIOUS,true);
            }
            else
            {
               _loc2_.setUidColor(ColorConstants.WHITE);
            }
            _loc2_.x = -4;
            _loc2_.y = 0;
            _loc5_.addChild(_loc2_);
            _loc3_ = new LabelBase();
            _loc3_.mouseEnabled = false;
            _loc3_.color = 16777215;
            _loc3_.autoSize = TextFieldAutoSize.NONE;
            _loc3_.align = TextFormatAlign.RIGHT;
            _loc3_.text = param1.kills;
            _loc3_.height = 20;
            _loc3_.width = 120;
            _loc3_.x = _width - 135;
            _loc3_.y = 0;
            _loc5_.addChild(_loc3_);
         }
         else
         {
            (_loc4_ = new LabelBase()).text = param1.noNameText;
            _loc4_.alpha = 0.5;
            _loc4_.x = 10;
            _loc5_.addChild(_loc4_);
         }
         return _loc5_;
      }
      
      override public function set listData(param1:ListData) : void
      {
         _listData = param1;
         label = "";
         if(this.nicon != null)
         {
            setStyle("icon",this.nicon);
         }
      }
      
      override protected function drawLayout() : void
      {
         super.drawLayout();
         background.width = width - 4;
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

