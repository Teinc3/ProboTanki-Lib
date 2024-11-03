package Renamed4312
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed5061 extends AbstractPacket
   {
      public var Renamed5557:int;
      
      public function Renamed5061(param1:int = 0)
      {
         super();
         this.Renamed5557 = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.Renamed5557 = param1 as int;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed5061();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 34;
      }
      
      override public function getPacketId() : int
      {
         return -2001666558;
      }
   }
}

