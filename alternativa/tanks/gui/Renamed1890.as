package alternativa.tanks.gui
{
   import Renamed1804.Renamed1895;
   import controls.Money;
   import controls.base.LabelBase;
   import controls.statassets.Renamed1883;
   import controls.statassets.Renamed1885;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import forms.ColorConstants;
   import forms.userlabel.UserLabel;
   
   public class Renamed1890 extends Renamed1895
   {
      public function Renamed1890()
      {
         super();
      }
      
      override public function set data(param1:Object) : void
      {
         var _loc2_:DisplayObject = null;
         var _loc3_:DisplayObject = null;
         _loc2_ = null;
         _loc3_ = null;
         _data = param1;
         _loc2_ = new Renamed1885();
         _loc3_ = new Renamed1883();
         this.mouseChildren = true;
         this.useHandCursor = false;
         this.buttonMode = false;
         nicon = this.myIcon(_data);
         setStyle("upSkin",_loc2_);
         setStyle("downSkin",_loc2_);
         setStyle("overSkin",_loc2_);
         setStyle("selectedUpSkin",_loc3_);
         setStyle("selectedOverSkin",_loc3_);
         setStyle("selectedDownSkin",_loc3_);
      }
      
      override protected function myIcon(param1:Object) : Sprite
      {
         var _loc2_:Sprite = null;
         var _loc3_:UserLabel = null;
         _loc2_ = new Sprite();
         _loc3_ = new UserLabel(param1.userId);
         _loc3_.inviteBattleEnable = true;
         _loc3_.setUidColor(ColorConstants.WHITE);
         _loc3_.x = -3;
         _loc3_.y = -1;
         _loc2_.addChild(_loc3_);
         var _loc4_:LabelBase;
         (_loc4_ = new LabelBase()).autoSize = TextFieldAutoSize.NONE;
         _loc4_.align = TextFormatAlign.RIGHT;
         _loc4_.width = 90;
         _loc4_.x = _width - 100;
         _loc4_.text = param1.income > -1 ? Money.numToString(param1.income,false) : "null";
         _loc4_.y = -1;
         _loc2_.addChild(_loc4_);
         return _loc2_;
      }
   }
}

