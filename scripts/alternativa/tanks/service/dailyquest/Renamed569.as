package alternativa.tanks.service.dailyquest
{
   import flash.events.EventDispatcher;
   
   public class Renamed569 extends EventDispatcher implements DailyQuestNotifierService
   {
      public function Renamed569()
      {
         super();
      }
      
      public function showNotification() : void
      {
         dispatchEvent(new Renamed3655(Renamed3655.Renamed3656));
      }
      
      public function hideNotification() : void
      {
         dispatchEvent(new Renamed3655(Renamed3655.Renamed3657));
      }
   }
}

