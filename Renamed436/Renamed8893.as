package Renamed436
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed8893 extends AbstractPacket
   {
      public var fund:int;
      
      public function Renamed8893(param1:int = 0)
      {
         super();
         this.fund = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.fund = param1 as int;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed8893();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 37;
      }
      
      override public function getPacketId() : int
      {
         return 1149211509;
      }
   }
}

