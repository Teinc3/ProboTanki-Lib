package controls.base
{
   import controls.Label;
   import flash.text.TextFieldAutoSize;
   import utils.FontParamsUtil;
   
   public class LabelBase extends Label
   {
      private var _autoSize:String;
      
      public function LabelBase()
      {
         super();
         sharpness = FontParamsUtil.SHARPNESS_LABEL_BASE;
         thickness = FontParamsUtil.THICKNESS_LABEL_BASE;
         this._autoSize = super.autoSize;
      }
      
      override public function set autoSize(param1:String) : void
      {
         super.autoSize = param1;
         this._autoSize = super.autoSize;
      }
      
      override public function set htmlText(param1:String) : void
      {
         var _loc2_:Number = NaN;
         super.autoSize = this._autoSize;
         super.htmlText = param1;
         if(super.autoSize == TextFieldAutoSize.CENTER)
         {
            _loc2_ = super.width;
            super.autoSize = TextFieldAutoSize.NONE;
            super.width = Math.ceil(_loc2_) + 1;
         }
      }
   }
}

