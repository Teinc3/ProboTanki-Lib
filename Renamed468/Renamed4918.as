package Renamed468
{
   import AbstractPackets.AbstractPacket;
   import Renamed602.3DPositionVector;
   
   public class Renamed4918 extends AbstractPacket
   {
      public var Renamed6864:int;
      
      public var barrel:int;
      
      public var shotId:int;
      
      public var shotDirection:3DPositionVector;
      
      public function Renamed4918(param1:int = 0, param2:int = 0, param3:int = 0, param4:3DPositionVector = null)
      {
         super();
         this.Renamed6864 = param1;
         this.barrel = param2;
         this.shotId = param3;
         this.shotDirection = param4;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.ByteCodec");
         addObjToAbsPacket(param3);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
         addObjToAbsPacket(param4);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecVector3d");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.Renamed6864 = param1 as int;
               break;
            case 1:
               this.barrel = param1 as int;
               break;
            case 2:
               this.shotId = param1 as int;
               break;
            case 3:
               this.shotDirection = param1 as 3DPositionVector;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed4918();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 51;
      }
      
      override public function getPacketId() : int
      {
         return -159686980;
      }
   }
}

