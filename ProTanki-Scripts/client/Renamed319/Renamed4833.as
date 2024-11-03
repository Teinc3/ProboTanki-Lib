package Renamed319
{
   import alternativa.tanks.service.IEntranceClientFacade;
   import Renamed346.Renamed4835;
   import Renamed346.Renamed7700;
   import platform.client.fp10.core.model.IObjectLoadListener;
   
   public class Renamed4833 extends Renamed7700 implements Renamed4835, Renamed4834, IObjectLoadListener
   {
      [Inject]
      public static var clientFacade:IEntranceClientFacade;
      
      public function Renamed4833()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         clientFacade.inviteEnabled = getInitParam().enabled;
      }
      
      public function Renamed3575() : void
      {
         clientFacade.Renamed3575();
      }
      
      public function Renamed7701() : void
      {
         clientFacade.Renamed3576();
      }
      
      public function Renamed3577(param1:String) : void
      {
         clientFacade.Renamed3577(param1);
      }
      
      public function checkInvite(param1:String) : void
      {
         server.Renamed7702(param1);
      }
      
      public function objectLoadedPost() : void
      {
      }
      
      public function objectUnloaded() : void
      {
      }
      
      public function objectUnloadedPost() : void
      {
      }
   }
}

