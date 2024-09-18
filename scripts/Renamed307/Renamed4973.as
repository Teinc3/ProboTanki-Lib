package Renamed4971
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed4973 extends AbstractPacket
   {
      public var Renamed2206:Boolean;
      
      public function Renamed4973(param1:Boolean = false)
      {
         super();
         this.Renamed2206 = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.Renamed2206 = param1 as Boolean;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed4973();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 23;
      }
      
      override public function getPacketId() : int
      {
         return -731115522;
      }
   }
}

