package Renamed425
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed6153 extends AbstractPacket
   {
      public var Renamed8776:Boolean;
      
      public function Renamed6153(param1:Boolean = false)
      {
         super();
         this.Renamed8776 = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.Renamed8776 = param1 as Boolean;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed6153();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 24;
      }
      
      override public function getPacketId() : int
      {
         return 1312986424;
      }
   }
}

