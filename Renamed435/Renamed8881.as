package Renamed435
{
   import alternativa.tanks.service.IEntranceClientFacade;
   import Renamed398.Renamed4840;
   import Renamed398.Renamed8508;
   import platform.client.fp10.core.model.IObjectLoadListener;
   
   public class Renamed4841 extends Renamed8508 implements Renamed4840, IObjectLoadListener
   {
      [Inject]
      public static var facade:IEntranceClientFacade;
      
      public function Renamed4841()
      {
         super();
      }
      
      public function serverHalt() : void
      {
         facade.serverHalt();
      }
      
      public function objectLoaded() : void
      {
         if(getInitParam().serverHalt)
         {
            facade.serverHalt();
         }
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

