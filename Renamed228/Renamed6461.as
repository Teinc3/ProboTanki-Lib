package Renamed228
{
   import Renamed189.AbstractPacket;
   import projects.tanks.client.battleservice.model.statistics.Renamed4207;
   
   public class Renamed6461 extends AbstractPacket
   {
      public var usersStat:Vector.<Renamed4207>;
      
      public function Renamed6461(param1:Vector.<Renamed4207> = null)
      {
         super();
         this.usersStat = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.custom.VectorCodecUserStat");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.usersStat = param1 as Vector.<Renamed4207>;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed6461();
      }
      
      override public function Renamed4883() : int
      {
         return 48;
      }
      
      override public function getPacketId() : int
      {
         return 1061006142;
      }
   }
}

