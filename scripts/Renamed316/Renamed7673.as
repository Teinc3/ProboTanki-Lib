package Renamed316
{
   import AbstractPackets.AbstractPacket;
   import Renamed602.3DPositionVector;
   
   public class Renamed7673 extends AbstractPacket
   {
      public var Renamed7669:int;
      
      public var relativeHitPoint:3DPositionVector;
      
      public var target:String;
      
      public var Renamed7527:int;
      
      public var Renamed1530:3DPositionVector;
      
      public var Renamed7528:3DPositionVector;
      
      public function Renamed7673(param1:int = 0, param2:3DPositionVector = null, param3:String = "", param4:int = 0, param5:3DPositionVector = null, param6:3DPositionVector = null)
      {
         super();
         this.Renamed7669 = param1;
         this.relativeHitPoint = param2;
         this.target = param3;
         this.Renamed7527 = param4;
         this.Renamed1530 = param5;
         this.Renamed7528 = param6;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecVector3d");
         addObjToAbsPacket(param3);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param4);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.ShortCodec");
         addObjToAbsPacket(param5);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecVector3d");
         addObjToAbsPacket(param6);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecVector3d");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.Renamed7669 = param1 as int;
               break;
            case 1:
               this.relativeHitPoint = param1 as 3DPositionVector;
               break;
            case 2:
               this.target = param1 as String;
               break;
            case 3:
               this.Renamed7527 = param1 as int;
               break;
            case 4:
               this.Renamed1530 = param1 as 3DPositionVector;
               break;
            case 5:
               this.Renamed7528 = param1 as 3DPositionVector;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed7673();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 52;
      }
      
      override public function getPacketId() : int
      {
         return 259979915;
      }
   }
}

