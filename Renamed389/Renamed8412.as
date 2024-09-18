package Renamed389
{
   import AbstractPackets.AbstractPacket;
   import Renamed602.3DPositionVector;
   
   public class Renamed8411 extends AbstractPacket
   {
      public var Renamed6864:int;
      
      public var target:String;
      
      public var shotId:int;
      
      public var Renamed1530:3DPositionVector;
      
      public var Renamed8410:Vector.<3DPositionVector>;
      
      public function Renamed8411(param1:int = 0, param2:String = "", param3:int = 0, param4:3DPositionVector = null, param5:Vector.<3DPositionVector> = null)
      {
         super();
         this.Renamed6864 = param1;
         this.target = param2;
         this.shotId = param3;
         this.Renamed1530 = param4;
         this.Renamed8410 = param5;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param3);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
         addObjToAbsPacket(param4);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecVector3d");
         addObjToAbsPacket(param5);
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
               this.target = param1 as String;
               break;
            case 2:
               this.shotId = param1 as int;
               break;
            case 3:
               this.Renamed1530 = param1 as 3DPositionVector;
               break;
            case 4:
               this.Renamed8410 = param1 as Vector.<3DPositionVector>;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed8411();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 53;
      }
      
      override public function getPacketId() : int
      {
         return 1229701582;
      }
   }
}

