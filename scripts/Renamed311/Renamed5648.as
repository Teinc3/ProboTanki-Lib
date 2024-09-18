package Renamed311
{
   import Renamed136.Renamed663;
   import AbstractPackets.AbstractPacket;
   
   public class Renamed5648 extends AbstractPacket
   {
      public var Renamed6591:Renamed663;
      
      public function Renamed5648(param1:Renamed663 = null)
      {
         super();
         this.Renamed6591 = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecBattleTeam");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.Renamed6591 = param1 as Renamed663;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed5648();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 33;
      }
      
      override public function getPacketId() : int
      {
         return -1284211503;
      }
   }
}

