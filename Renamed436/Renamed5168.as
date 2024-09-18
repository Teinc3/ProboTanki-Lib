package Renamed436
{
   import Renamed189.AbstractPacket;
   import projects.tanks.client.battleservice.model.statistics.Renamed4220;
   
   public class Renamed5168 extends AbstractPacket
   {
      public var initParams:Renamed4220;
      
      public function Renamed5168(param1:Renamed4220 = null)
      {
         super();
         this.initParams = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecStatisticsModelCC");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.initParams = param1 as Renamed4220;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed5168();
      }
      
      override public function Renamed4883() : int
      {
         return 37;
      }
      
      override public function getPacketId() : int
      {
         return 522993449;
      }
   }
}

