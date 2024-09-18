package §]@§
{
   import §[!#§.§try for const§;
   import controls.base.LabelBase;
   import flash.text.TextFieldAutoSize;
   
   public class §3#D§ extends MainPanelDailyQuestButton
   {
      private const §2O§:int = 72;
      
      private const §4#u§:int = -4;
      
      private const §class const switch§:int = 18;
      
      private const §^#%§:int = 4;
      
      private var §set catch get§:LabelBase;
      
      public function §3#D§()
      {
         super();
         this.§set catch get§ = new LabelBase();
         this.§set catch get§.x = this.§class const switch§;
         this.§set catch get§.y = this.§^#%§;
         this.§set catch get§.width = this.width - this.§class const switch§;
         this.§set catch get§.autoSize = TextFieldAutoSize.CENTER;
         this.§set catch get§.mouseEnabled = false;
         addChild(this.§set catch get§);
         var _loc1_:§try for const§ = new §try for const§();
         addChild(_loc1_);
         _loc1_.x = this.§2O§;
         _loc1_.y = this.§4#u§;
      }
      
      override public function set label(param1:String) : void
      {
         this.§set catch get§.htmlText = param1;
      }
   }
}

