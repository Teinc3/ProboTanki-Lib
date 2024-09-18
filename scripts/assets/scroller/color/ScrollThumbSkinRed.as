package assets.scroller.color
{
   import assets.scroller.ScrollThumbSkin;
   import assets.scroller.ThumbMiddleRed;
   import assets.scroller.ThumbTopRed;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol600")]
   public class ScrollThumbSkinRed extends ScrollThumbSkin
   {
      public function ScrollThumbSkinRed()
      {
         super();
      }
      
      override public function initSkin() : void
      {
         toppng = new ThumbTopRed(14,1);
         midpng = new ThumbMiddleRed(14,1);
      }
   }
}

