package Renamed267
{
   import AbstractPackets.AbstractPacket;
   import Renamed602.3DPositionVector;
   
   public class Renamed6874 extends AbstractPacket
   {
      public var shooter:String;
      
      public var staticHitPoint:3DPositionVector;
      
      public var targets:Vector.<String>;
      
      public var targetHitPoints:Vector.<3DPositionVector>;
      
      public function Renamed6874(param1:String = "", param2:3DPositionVector = null, param3:Vector.<String> = null, param4:Vector.<3DPositionVector> = null)
      {
         super();
         this.shooter = param1;
         this.staticHitPoint = param2;
         this.targets = param3;
         this.targetHitPoints = param4;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecVector3d");
         addObjToAbsPacket(param3);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.complex.VectorCodecString");
         addObjToAbsPacket(param4);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.VectorCodecVector3d");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.shooter = param1 as String;
               break;
            case 1:
               this.staticHitPoint = param1 as 3DPositionVector;
               break;
            case 2:
               this.targets = param1 as Vector.<String>;
               break;
            case 3:
               this.targetHitPoints = param1 as Vector.<3DPositionVector>;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed6874();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 54;
      }
      
      override public function getPacketId() : int
      {
         return -369590613;
      }
   }
}

