package Renamed467
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed9320 extends AbstractPacket
   {
      public var flagId:int;
      
      public var tank:String;
      
      public function Renamed9320(param1:int = 0, param2:String = "")
      {
         super();
         this.flagId = param1;
         this.tank = param2;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.flagId = param1 as int;
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
         return 71;
      }
      
      override public function getPacketId() : int
      {
         return 142177784;
      }
   }
}

