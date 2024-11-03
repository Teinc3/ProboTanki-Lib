package Renamed387
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed8388 extends AbstractPacket
   {
      public var enabled:Boolean;
      
      public function Renamed8388(param1:Boolean = false)
      {
         super();
         this.enabled = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.enabled = param1 as Boolean;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed8388();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 10;
      }
      
      override public function getPacketId() : int
      {
         return 150222118;
      }
   }
}

