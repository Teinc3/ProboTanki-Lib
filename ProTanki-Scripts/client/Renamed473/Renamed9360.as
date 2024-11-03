package Renamed7249
{
   import Renamed136.Renamed663;
   import AbstractPackets.AbstractPacket;
   
   public class Renamed9360 extends AbstractPacket
   {
      public var team:Renamed663;
      
      public function Renamed9360(param1:Renamed663 = null)
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
         return new Renamed9360();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 42;
      }
      
      override public function getPacketId() : int
      {
         return -1142938284;
      }
   }
}

