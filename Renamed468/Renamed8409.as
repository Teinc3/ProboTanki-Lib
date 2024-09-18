package Renamed468
{
   import AbstractPackets.AbstractPacket;
   import Renamed602.3DPositionVector;
   
   public class Renamed8409 extends AbstractPacket
   {
      public var Renamed6864:int;
      
      public var shotId:int;
      
      public var Renamed7528:3DPositionVector;
      
      public function Renamed8409(param1:int = 0, param2:int = 0, param3:3DPositionVector = null)
      {
         super();
         this.Renamed6864 = param1;
         this.shotId = param2;
         this.Renamed7528 = param3;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
         addObjToAbsPacket(param3);
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
               this.shotId = param1 as int;
               break;
            case 2:
               this.Renamed7528 = param1 as 3DPositionVector;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed8409();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 51;
      }
      
      override public function getPacketId() : int
      {
         return -482023661;
      }
   }
}

