package alternativa.tanks.view.events
{
   import flash.events.Event;
   
   public class RefreshCaptchaClickedEvent extends Event
   {
      public static const CLICKED:String = "RefreshCaptchaClickedEvent.CLICKED";
      
      public function RefreshCaptchaClickedEvent()
      {
         super(CLICKED,true);
      }
   }
}

