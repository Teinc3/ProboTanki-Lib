package alternativa.tanks.view.battlelist.forms
{
   import assets.cellrenderer.battlelist.CellRenderer_disabledDownSkin;
   import assets.cellrenderer.battlelist.CellRenderer_disabledOverSkin;
   import assets.cellrenderer.battlelist.CellRenderer_disabledSelectedDownSkin;
   import assets.cellrenderer.battlelist.CellRenderer_disabledSelectedOverSkin;
   import assets.cellrenderer.battlelist.CellRenderer_disabledSelectedUpSkin;
   import assets.cellrenderer.battlelist.CellRenderer_disabledUpSkin;
   import assets.cellrenderer.battlelist.CellRenderer_downSkin;
   import assets.cellrenderer.battlelist.CellRenderer_overSkin;
   import assets.cellrenderer.battlelist.CellRenderer_selectedDownSkin;
   import assets.cellrenderer.battlelist.CellRenderer_selectedOverSkin;
   import assets.cellrenderer.battlelist.CellRenderer_selectedUpSkin;
   import assets.cellrenderer.battlelist.CellRenderer_upSkin;
   import fl.controls.listClasses.CellRenderer;
   import fl.controls.listClasses.ListData;
   import flash.display.DisplayObject;
   
   public class BattleListRenderer extends CellRenderer
   {
      private var access:Boolean = true;
      
      private var nicon:DisplayObject;
      
      private var sicon:DisplayObject;
      
      public function BattleListRenderer()
      {
         super();
      }
      
      override public function set data(param1:Object) : void
      {
         _data = param1;
         this.access = param1.accessible;
         this.nicon = param1.iconNormal;
         this.sicon = param1.iconSelected;
         if(!this.access)
         {
            setStyle("upSkin",CellRenderer_disabledUpSkin);
            setStyle("downSkin",CellRenderer_disabledDownSkin);
            setStyle("overSkin",CellRenderer_disabledOverSkin);
            setStyle("selectedUpSkin",CellRenderer_disabledSelectedUpSkin);
            setStyle("selectedOverSkin",CellRenderer_disabledSelectedOverSkin);
            setStyle("selectedDownSkin",CellRenderer_disabledSelectedDownSkin);
         }
         else
         {
            setStyle("upSkin",CellRenderer_upSkin);
            setStyle("downSkin",CellRenderer_downSkin);
            setStyle("overSkin",CellRenderer_overSkin);
            setStyle("selectedUpSkin",CellRenderer_selectedUpSkin);
            setStyle("selectedOverSkin",CellRenderer_selectedOverSkin);
            setStyle("selectedDownSkin",CellRenderer_selectedDownSkin);
         }
      }
      
      override public function set listData(param1:ListData) : void
      {
         _listData = param1;
         label = _listData.label;
         if(this.nicon != null && this.sicon != null)
         {
            setStyle("icon",this.nicon);
            setStyle("selectedUpIcon",this.sicon);
            setStyle("selectedOverIcon",this.sicon);
            setStyle("selectedDownIcon",this.sicon);
         }
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

