package assets.scroller.color
{
   import assets.scroller.ScrollThumbSkin;
   import assets.scroller.ThumbMiddleBlue;
   import assets.scroller.ThumbTopBlue;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol597")]
   public class ScrollThumbSkinBlue extends ScrollThumbSkin
   {
      public function ScrollThumbSkinBlue()
      {
         super();
      }
      
      override public function initSkin() : void
      {
         toppng = new ThumbTopBlue(14,1);
         midpng = new ThumbMiddleBlue(14,1);
      }
   }
}

