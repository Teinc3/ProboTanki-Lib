package Renamed464
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed9280 extends AbstractPacket
   {
      public var url:String;
      
      public function Renamed9280(param1:String = "")
      {
         super();
         this.url = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.url = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed9280();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 16;
      }
      
      override public function getPacketId() : int
      {
         return -1455955413;
      }
   }
}

