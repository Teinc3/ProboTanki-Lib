package Renamed2402
{
   import AbstractPackets.AbstractPacket;
   import Renamed602.3DPositionVector;
   
   public class Renamed5373 extends AbstractPacket
   {
      public var bonusId:String;
      
      public var position:3DPositionVector;
      
      public var Renamed5374:int;
      
      public function Renamed5373(param1:String = "", param2:3DPositionVector = null, param3:int = 0)
      {
         super();
         this.bonusId = param1;
         this.position = param2;
         this.Renamed5374 = param3;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecVector3d");
         addObjToAbsPacket(param3);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.bonusId = param1 as String;
               break;
            case 1:
               this.position = param1 as 3DPositionVector;
               break;
            case 2:
               this.Renamed5374 = param1 as int;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed5373();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 36;
      }
      
      override public function getPacketId() : int
      {
         return 1831462385;
      }
   }
}

