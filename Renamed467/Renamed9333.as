package Renamed467
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed9333 extends AbstractPacket
   {
      public var flagId:int;
      
      public var tankId:String;
      
      public function Renamed9333(param1:int = 0, param2:String = "")
      {
         super();
         this.flagId = param1;
         this.tankId = param2;
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
               this.tankId = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed9333();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 71;
      }
      
      override public function getPacketId() : int
      {
         return -325434725;
      }
   }
}

