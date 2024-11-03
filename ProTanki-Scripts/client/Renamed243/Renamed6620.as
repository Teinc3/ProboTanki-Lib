package Renamed27
{
   import Renamed4586.Renamed4587;
   import Renamed4586.Renamed6520;
   import alternativa.tanks.services.ping.PingService;
   import flash.utils.getTimer;
   
   public class Renamed28 extends Renamed6520 implements Renamed4587
   {
      [Inject]
      public static var Renamed4731:PingService;
      
      public function Renamed28()
      {
         super();
      }
      
      [Obfuscation(rename="false")]
      public function Renamed3830(param1:int, param2:Number) : void
      {
         server.Renamed5802(getTimer(),param1);
         Renamed4731.Renamed3829(param2);
      }
   }
}

