package Renamed304
{
   import AbstractPackets.AbstractPacket;
   import Renamed602.3DPositionVector;
   
   public class Renamed6178 extends AbstractPacket
   {
      public var Renamed6864:int;
      
      public var target:String;
      
      public var Renamed7527:int;
      
      public var Renamed1530:3DPositionVector;
      
      public var hitPoint:3DPositionVector;
      
      public var Renamed7528:3DPositionVector;
      
      public function Renamed6178(param1:int = 0, param2:String = "", param3:int = 0, param4:3DPositionVector = null, param5:3DPositionVector = null, param6:3DPositionVector = null)
      {
         super();
         this.Renamed6864 = param1;
         this.target = param2;
         this.Renamed7527 = param3;
         this.Renamed1530 = param4;
         this.hitPoint = param5;
         this.Renamed7528 = param6;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param3);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.ShortCodec");
         addObjToAbsPacket(param4);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecVector3d");
         addObjToAbsPacket(param5);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecVector3d");
         addObjToAbsPacket(param6);
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
               this.target = param1 as String;
               break;
            case 2:
               this.Renamed7527 = param1 as int;
               break;
            case 3:
               this.Renamed1530 = param1 as 3DPositionVector;
               break;
            case 4:
               this.hitPoint = param1 as 3DPositionVector;
               break;
            case 5:
               this.Renamed7528 = param1 as 3DPositionVector;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed6178();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 49;
      }
      
      override public function getPacketId() : int
      {
         return 229267683;
      }
   }
}

