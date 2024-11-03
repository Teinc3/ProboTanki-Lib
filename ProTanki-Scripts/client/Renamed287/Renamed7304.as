package Renamed7273
{
   import AbstractPackets.AbstractPacket;
   import Renamed602.3DPositionVector;
   
   public class Renamed7304 extends AbstractPacket
   {
      public var targetTank:String;
      
      public var localSpotPosition:3DPositionVector;
      
      public function Renamed7304(param1:String = "", param2:3DPositionVector = null)
      {
         super();
         this.targetTank = param1;
         this.localSpotPosition = param2;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecVector3d");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.targetTank = param1 as String;
               break;
            case 1:
               this.localSpotPosition = param1 as 3DPositionVector;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed7304();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 50;
      }
      
      override public function getPacketId() : int
      {
         return -1517837003;
      }
   }
}

