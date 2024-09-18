package Renamed316
{
   import AbstractPackets.AbstractPacket;
   import Renamed602.3DPositionVector;
   
   public class Renamed7538 extends AbstractPacket
   {
      public var shooter:String;
      
      public var hitPoint:3DPositionVector;
      
      public function Renamed7538(param1:String = "", param2:3DPositionVector = null)
      {
         super();
         this.shooter = param1;
         this.hitPoint = param2;
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
               this.shooter = param1 as String;
               break;
            case 1:
               this.hitPoint = param1 as 3DPositionVector;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed7538();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 52;
      }
      
      override public function getPacketId() : int
      {
         return 1690491826;
      }
   }
}

