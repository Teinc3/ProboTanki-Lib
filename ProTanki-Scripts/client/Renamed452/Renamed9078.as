package Renamed452
{
   import AbstractPackets.AbstractPacket;
   import Renamed602.3DPositionVector;
   
   public class Renamed9077 extends AbstractPacket
   {
      public var Renamed6864:int;
      
      public var direction:3DPositionVector;
      
      public function Renamed9077(param1:int = 0, param2:3DPositionVector = null)
      {
         super();
         this.Renamed6864 = param1;
         this.direction = param2;
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
               this.direction = param1 as 3DPositionVector;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed9077();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 74;
      }
      
      override public function getPacketId() : int
      {
         return 299028276;
      }
   }
}

