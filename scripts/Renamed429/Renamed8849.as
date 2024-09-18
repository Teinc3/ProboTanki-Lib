package Renamed429
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed8849 extends AbstractPacket
   {
      public var pointId:int;
      
      public function Renamed8849(param1:int = 0)
      {
         super();
         this.pointId = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.pointId = param1 as int;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed8849();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 60;
      }
      
      override public function getPacketId() : int
      {
         return -1548609916;
      }
   }
}

