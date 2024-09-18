package Renamed495
{
   import AbstractPackets.AbstractPacket;
   import Renamed602.3DPositionVector;
   
   public class Renamed4845 extends AbstractPacket
   {
      public var time:int;
      
      public var targets:Vector.<String>;
      
      public var Renamed3144:Vector.<int>;
      
      public var Renamed6866:Vector.<3DPositionVector>;
      
      public var Renamed6867:Vector.<3DPositionVector>;
      
      public function Renamed4845(param1:int = 0, param2:Vector.<String> = null, param3:Vector.<int> = null, param4:Vector.<3DPositionVector> = null, param5:Vector.<3DPositionVector> = null)
      {
         super();
         this.time = param1;
         this.targets = param2;
         this.Renamed3144 = param3;
         this.Renamed6866 = param4;
         this.Renamed6867 = param5;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.complex.VectorCodecString");
         addObjToAbsPacket(param3);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.VectorCodecShort");
         addObjToAbsPacket(param4);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.VectorCodecVector3d");
         addObjToAbsPacket(param5);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.VectorCodecVector3d");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.time = param1 as int;
               break;
            case 1:
               this.targets = param1 as Vector.<String>;
               break;
            case 2:
               this.Renamed3144 = param1 as Vector.<int>;
               break;
            case 3:
               this.Renamed6866 = param1 as Vector.<3DPositionVector>;
               break;
            case 4:
               this.Renamed6867 = param1 as Vector.<3DPositionVector>;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed4845();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 57;
      }
      
      override public function getPacketId() : int
      {
         return 1395251766;
      }
   }
}

