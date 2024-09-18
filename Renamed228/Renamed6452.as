package Renamed228
{
   import Renamed189.AbstractPacket;
   import projects.tanks.client.battleservice.model.statistics.Renamed4207;
   
   public class Renamed6451 extends AbstractPacket
   {
      public var usersStat:Renamed4207;
      
      public function Renamed6451(param1:Renamed4207 = null)
      {
         super();
         this.usersStat = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecUserStat");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.usersStat = param1 as Renamed4207;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed6451();
      }
      
      override public function Renamed4883() : int
      {
         return 48;
      }
      
      override public function getPacketId() : int
      {
         return 696140460;
      }
   }
}

