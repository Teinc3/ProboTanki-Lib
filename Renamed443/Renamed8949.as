package Renamed443
{
   import Renamed330.Renamed4477;
   import Renamed330.Renamed7823;
   import forms.ServerStopAlert;
   import projects.tanks.clients.flash.commons.services.serverhalt.IServerHaltService;
   
   public class Renamed4480 extends Renamed7823 implements Renamed4477
   {
      [Inject]
      public static var Renamed4481:IServerHaltService;
      
      public function Renamed4480()
      {
         super();
      }
      
      public function Renamed7821(param1:int) : void
      {
         Renamed4481.setServerHalt(true);
         var _loc2_:ServerStopAlert = new ServerStopAlert(param1);
      }
   }
}

