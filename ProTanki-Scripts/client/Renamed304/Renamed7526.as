package Renamed304
{
   import AbstractPackets.AbstractPacket;
   import Renamed602.3DPositionVector;
   
   public class Renamed6177 extends AbstractPacket
   {
      public var Renamed6864:int;
      
      public var hitPoint:3DPositionVector;
      
      public function Renamed6177(param1:int = 0, param2:3DPositionVector = null)
      {
         super();
         this.Renamed6864 = param1;
         this.hitPoint = param2;
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
               this.Renamed6864 = param1 as int;
               break;
            case 1:
               this.hitPoint = param1 as 3DPositionVector;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed6177();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 49;
      }
      
      override public function getPacketId() : int
      {
         return 1470597926;
      }
   }
}

