package Renamed7249
{
   import Renamed136.Renamed663;
   import AbstractPackets.AbstractPacket;
   
   public class Renamed9320 extends AbstractPacket
   {
      public var flagTeam:Renamed663;
      
      public var tank:String;
      
      public function Renamed9320(param1:Renamed663 = null, param2:String = "")
      {
         super();
         this.flagTeam = param1;
         this.tank = param2;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecBattleTeam");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.flagTeam = param1 as Renamed663;
               break;
            case 1:
               this.tank = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed9320();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 42;
      }
      
      override public function getPacketId() : int
      {
         return -1026428589;
      }
   }
}

