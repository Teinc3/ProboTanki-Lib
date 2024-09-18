package Renamed9348
{
   import Renamed136.Renamed663;
   import AbstractPackets.AbstractPacket;
   import projects.tanks.client.battleservice.model.statistics.Renamed4207;
   
   public class Renamed6451 extends AbstractPacket
   {
      public var usersStat:Renamed4207;
      
      public var team:Renamed663;
      
      public function Renamed6451(param1:Renamed4207 = null, param2:Renamed663 = null)
      {
         super();
         this.usersStat = param1;
         this.team = param2;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecUserStat");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecBattleTeam");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.usersStat = param1 as Renamed4207;
               break;
            case 1:
               this.team = param1 as Renamed663;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed6451();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 44;
      }
      
      override public function getPacketId() : int
      {
         return -497293992;
      }
   }
}

