package Renamed304
{
   import AbstractPackets.AbstractPacket;
   import Renamed602.3DPositionVector;
   
   public class Renamed7523 extends AbstractPacket
   {
      public var shooter:String;
      
      public var target:String;
      
      public var hitPoint:3DPositionVector;
      
      public var weakeningCoeff:Number;
      
      public var isCritical:Boolean;
      
      public function Renamed7523(param1:String = "", param2:String = "", param3:3DPositionVector = null, param4:Number = 0, param5:Boolean = false)
      {
         super();
         this.shooter = param1;
         this.target = param2;
         this.hitPoint = param3;
         this.weakeningCoeff = param4;
         this.isCritical = param5;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param3);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecVector3d");
         addObjToAbsPacket(param4);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.FloatCodec");
         addObjToAbsPacket(param5);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.BooleanCodec");
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
               this.hitPoint = param1 as 3DPositionVector;
               break;
            case 3:
               this.weakeningCoeff = param1 as Number;
               break;
            case 4:
               this.isCritical = param1 as Boolean;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed7523();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 49;
      }
      
      override public function getPacketId() : int
      {
         return -1334002026;
      }
   }
}

