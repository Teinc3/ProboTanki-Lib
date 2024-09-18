package Renamed467
{
   import AbstractPackets.AbstractPacket;
   import Renamed602.3DPositionVector;
   
   public class Renamed9330 extends AbstractPacket
   {
      public var flagId:int;
      
      public var position:3DPositionVector;
      
      public function Renamed9330(param1:int = 0, param2:3DPositionVector = null)
      {
         super();
         this.flagId = param1;
         this.position = param2;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecVector3d");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.flagId = param1 as int;
               break;
            case 1:
               this.position = param1 as 3DPositionVector;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed9330();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 71;
      }
      
      override public function getPacketId() : int
      {
         return 1817559787;
      }
   }
}

