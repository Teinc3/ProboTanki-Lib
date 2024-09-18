package Renamed4292
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed4293 extends AbstractPacket
   {
      public var rememberMe:Boolean;
      
      public function Renamed4293(param1:Boolean = false)
      {
         super();
         this.rememberMe = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.rememberMe = param1 as Boolean;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed4293();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 3;
      }
      
      override public function getPacketId() : int
      {
         return -1967950183;
      }
   }
}

