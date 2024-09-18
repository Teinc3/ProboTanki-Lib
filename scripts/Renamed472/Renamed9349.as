package Renamed9348
{
   import Renamed136.Renamed663;
   import AbstractPackets.AbstractPacket;
   
   public class Renamed9349 extends AbstractPacket
   {
      public var team:Renamed663;
      
      public var score:int;
      
      public function Renamed9349(param1:Renamed663 = null, param2:int = 0)
      {
         super();
         this.team = param1;
         this.score = param2;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecBattleTeam");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.team = param1 as Renamed663;
               break;
            case 1:
               this.score = param1 as int;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed9349();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 44;
      }
      
      override public function getPacketId() : int
      {
         return 561771020;
      }
   }
}

