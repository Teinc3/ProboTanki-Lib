package controls.friends
{
   import controls.base.LabelBase;
   import flash.text.TextFieldAutoSize;
   
   public class FriendsButton extends MainPanelFriendsButton
   {
      private var _labelBase:LabelBase;
      
      public function FriendsButton()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         this._labelBase = new LabelBase();
         this._labelBase.x = 18;
         this._labelBase.y = 4;
         this._labelBase.width = this.width - 18;
         this._labelBase.autoSize = TextFieldAutoSize.CENTER;
         this._labelBase.mouseEnabled = false;
         addChild(this._labelBase);
         var _loc1_:NewRequestIndicator = new NewRequestIndicator();
         addChild(_loc1_);
         _loc1_.x = 76;
         _loc1_.y = -4;
      }
      
      override public function set label(param1:String) : void
      {
         this._labelBase.text = param1;
      }
   }
}

