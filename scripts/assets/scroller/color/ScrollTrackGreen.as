package assets.scroller.color
{
   import assets.scroller.ScrollTrackSkin;
   import assets.scroller.TrackGreen;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol341")]
   public class ScrollTrackGreen extends ScrollTrackSkin
   {
      public function ScrollTrackGreen()
      {
         super();
      }
      
      override public function initSkin() : void
      {
         tracpng = new TrackGreen(15,3);
      }
   }
}

