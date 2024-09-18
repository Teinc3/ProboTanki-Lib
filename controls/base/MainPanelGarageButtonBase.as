package controls.base
{
   import flash.text.TextFieldAutoSize;
   
   public class MainPanelGarageButtonBase extends MainPanelGarageButton
   {
      private var _labelBase:LabelBase;
      
      public function MainPanelGarageButtonBase()
      {
         super();
         this._labelBase = new LabelBase();
         this._labelBase.x = 18;
         this._labelBase.y = 4;
         this._labelBase.width = this.width - 18;
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

