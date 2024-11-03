package Renamed429
{
   import AbstractPackets.AbstractPacket;
   import Renamed206.Renamed5125;
   
   public class Renamed8850 extends AbstractPacket
   {
      public var pointId:int;
      
      public var state:Renamed5125;
      
      public function Renamed8850(param1:int = 0, param2:Renamed5125 = null)
      {
         super();
         this.pointId = param1;
         this.state = param2;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecControlPointState");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.pointId = param1 as int;
               break;
            case 1:
               this.state = param1 as Renamed5125;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed8850();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 60;
      }
      
      override public function getPacketId() : int
      {
         return -1073178885;
      }
   }
}

