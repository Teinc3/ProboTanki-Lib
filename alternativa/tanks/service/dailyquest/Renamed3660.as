package alternativa.tanks.service.dailyquest
{
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadPostListener;
   import Renamed413.Renamed3658;
   import Renamed413.Renamed3659;
   
   public class Renamed3660 extends Renamed3658 implements Renamed3659, ObjectLoadPostListener, ObjectUnloadPostListener
   {
      [Inject]
      public static var Renamed3661:DailyQuestNotifierService;
      
      public function Renamed3660()
      {
         super();
      }
      
      public function Renamed3662() : void
      {
         Renamed3661.showNotification();
      }
      
      public function objectLoadedPost() : void
      {
         Renamed3661.addEventListener(Renamed3655.Renamed3657,this.Renamed3663);
      }
      
      private function Renamed3663(param1:Renamed3655) : void
      {
         server.Renamed3664();
      }
      
      public function objectUnloadedPost() : void
      {
         Renamed3661.removeEventListener(Renamed3655.Renamed3657,this.Renamed3663);
      }
      
      public function Renamed3665() : void
      {
         Renamed3661.showNotification();
      }
   }
}

