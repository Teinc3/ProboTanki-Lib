package Renamed228
{
   import AbstractPackets.AbstractPacket;
   import projects.tanks.client.battleservice.model.statistics.Renamed4207;
   
   public class Renamed6451 extends AbstractPacket
   {
      public var usersStat:Renamed4207;
      
      public function Renamed6451(param1:Renamed4207 = null)
      {
         super();
         this.usersStat = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecUserStat");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.usersStat = param1 as Renamed4207;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed6451();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 48;
      }
      
      override public function getPacketId() : int
      {
         return 696140460;
      }
   }
}

