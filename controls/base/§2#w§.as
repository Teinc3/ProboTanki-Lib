package controls.base
{
   import flash.text.TextFieldAutoSize;
   
   public class §2#w§ extends MainPanelAccountButton
   {
      private var _labelBase:LabelBase;
      
      public function §2#w§()
      {
         super();
         this._labelBase = new LabelBase();
         this._labelBase.x = 16;
         this._labelBase.y = 4;
         this._labelBase.width = this.width - 16;
         this._labelBase.autoSize = TextFieldAutoSize.CENTER;
         this._labelBase.mouseEnabled = false;
         addChild(this._labelBase);
      }
      
      override public function set label(param1:String) : void
      {
         this._labelBase.text = param1;
      }
   }
}

