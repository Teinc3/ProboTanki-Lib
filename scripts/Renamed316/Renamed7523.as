package Renamed316
{
   import AbstractPackets.AbstractPacket;
   import Renamed602.3DPositionVector;
   
   public class Renamed7523 extends AbstractPacket
   {
      public var shooter:String;
      
      public var target:String;
      
      public var relativeHitPoint:3DPositionVector;
      
      public function Renamed7523(param1:String = "", param2:String = "", param3:3DPositionVector = null)
      {
         super();
         this.shooter = param1;
         this.target = param2;
         this.relativeHitPoint = param3;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param3);
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
               this.target = param1 as String;
               break;
            case 2:
               this.relativeHitPoint = param1 as 3DPositionVector;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed7523();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 52;
      }
      
      override public function getPacketId() : int
      {
         return -190359403;
      }
   }
}

