package Renamed267
{
   import AbstractPackets.AbstractPacket;
   import Renamed602.3DPositionVector;
   
   public class Renamed4918 extends AbstractPacket
   {
      public var Renamed6864:int;
      
      public var staticHitPoint:3DPositionVector;
      
      public var targets:Vector.<String>;
      
      public var targetHitPoints:Vector.<3DPositionVector>;
      
      public var Renamed6865:Vector.<int>;
      
      public var Renamed6866:Vector.<3DPositionVector>;
      
      public var Renamed6867:Vector.<3DPositionVector>;
      
      public function Renamed4918(param1:int = 0, param2:3DPositionVector = null, param3:Vector.<String> = null, param4:Vector.<3DPositionVector> = null, param5:Vector.<int> = null, param6:Vector.<3DPositionVector> = null, param7:Vector.<3DPositionVector> = null)
      {
         super();
         this.Renamed6864 = param1;
         this.staticHitPoint = param2;
         this.targets = param3;
         this.targetHitPoints = param4;
         this.Renamed6865 = param5;
         this.Renamed6866 = param6;
         this.Renamed6867 = param7;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecVector3d");
         addObjToAbsPacket(param3);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.complex.VectorCodecString");
         addObjToAbsPacket(param4);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.VectorCodecVector3d");
         addObjToAbsPacket(param5);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.VectorCodecShort");
         addObjToAbsPacket(param6);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.VectorCodecVector3d");
         addObjToAbsPacket(param7);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.VectorCodecVector3d");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.Renamed6864 = param1 as int;
               break;
            case 1:
               this.staticHitPoint = param1 as 3DPositionVector;
               break;
            case 2:
               this.targets = param1 as Vector.<String>;
               break;
            case 3:
               this.targetHitPoints = param1 as Vector.<3DPositionVector>;
               break;
            case 4:
               this.Renamed6865 = param1 as Vector.<int>;
               break;
            case 5:
               this.Renamed6866 = param1 as Vector.<3DPositionVector>;
               break;
            case 6:
               this.Renamed6867 = param1 as Vector.<3DPositionVector>;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed4918();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 54;
      }
      
      override public function getPacketId() : int
      {
         return -484994657;
      }
   }
}

