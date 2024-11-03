package Renamed7249
{
   import Renamed136.Renamed663;
   import AbstractPackets.AbstractPacket;
   
   public class Renamed9333 extends AbstractPacket
   {
      public var tankId:String;
      
      public var flagTeam:Renamed663;
      
      public function Renamed9333(param1:String = "", param2:Renamed663 = null)
      {
         super();
         this.tankId = param1;
         this.flagTeam = param2;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecBattleTeam");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.tankId = param1 as String;
               break;
            case 1:
               this.flagTeam = param1 as Renamed663;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed9333();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 42;
      }
      
      override public function getPacketId() : int
      {
         return -1282406496;
      }
   }
}

