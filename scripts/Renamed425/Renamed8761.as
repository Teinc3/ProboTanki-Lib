package Renamed425
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed8761 extends AbstractPacket
   {
      public var message:String;
      
      public function Renamed8761(param1:String = "")
      {
         super();
         this.message = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.message = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed8761();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 24;
      }
      
      override public function getPacketId() : int
      {
         return 2145091885;
      }
   }
}

