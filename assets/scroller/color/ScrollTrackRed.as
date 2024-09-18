package assets.scroller.color
{
   import assets.scroller.ScrollTrackSkin;
   import assets.scroller.TrackRed;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol598")]
   public class ScrollTrackRed extends ScrollTrackSkin
   {
      public function ScrollTrackRed()
      {
         super();
      }
      
      override public function initSkin() : void
      {
         tracpng = new TrackRed(15,3);
      }
   }
}

