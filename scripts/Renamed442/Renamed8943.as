package Renamed442
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed8943 extends AbstractPacket
   {
      public var symbolCost:int;
      
      public var enterCost:int;
      
      public function Renamed8943(param1:int = 0, param2:int = 0)
      {
         super();
         this.symbolCost = param1;
         this.enterCost = param2;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.symbolCost = param1 as int;
               break;
            case 1:
               this.enterCost = param1 as int;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed8943();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 28;
      }
      
      override public function getPacketId() : int
      {
         return 744948472;
      }
   }
}

