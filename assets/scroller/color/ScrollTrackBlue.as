package assets.scroller.color
{
   import assets.scroller.ScrollTrackSkin;
   import assets.scroller.TrackBlue;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol601")]
   public class ScrollTrackBlue extends ScrollTrackSkin
   {
      public function ScrollTrackBlue()
      {
         super();
      }
      
      override public function initSkin() : void
      {
         tracpng = new TrackBlue(15,3);
      }
   }
}

