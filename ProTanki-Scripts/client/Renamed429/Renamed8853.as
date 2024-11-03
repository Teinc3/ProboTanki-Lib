package Renamed429
{
   import Renamed136.Renamed663;
   import AbstractPackets.AbstractPacket;
   
   public class Renamed8853 extends AbstractPacket
   {
      public var team:Renamed663;
      
      public function Renamed8853(param1:Renamed663 = null)
      {
         super();
         this.team = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecBattleTeam");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.team = param1 as Renamed663;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed8853();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 60;
      }
      
      override public function getPacketId() : int
      {
         return -1701488017;
      }
   }
}

