package Renamed400
{
   import AbstractPackets.AbstractPacket;
   import Renamed602.3DPositionVector;
   
   public class Renamed8548 extends AbstractPacket
   {
      public var time:int;
      
      public var Renamed7527:int;
      
      public var Renamed1530:3DPositionVector;
      
      public var localHitPoint:3DPositionVector;
      
      public function Renamed8548(param1:int = 0, param2:int = 0, param3:3DPositionVector = null, param4:3DPositionVector = null)
      {
         super();
         this.time = param1;
         this.Renamed7527 = param2;
         this.Renamed1530 = param3;
         this.localHitPoint = param4;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.ShortCodec");
         addObjToAbsPacket(param3);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecVector3d");
         addObjToAbsPacket(param4);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecVector3d");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.time = param1 as int;
               break;
            case 1:
               this.Renamed7527 = param1 as int;
               break;
            case 2:
               this.Renamed1530 = param1 as 3DPositionVector;
               break;
            case 3:
               this.localHitPoint = param1 as 3DPositionVector;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed8548();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 55;
      }
      
      override public function getPacketId() : int
      {
         return 244072998;
      }
   }
}

