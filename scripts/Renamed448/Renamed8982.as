package Renamed448
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed8982 extends AbstractPacket
   {
      public var header:String;
      
      public function Renamed8982(param1:String = "")
      {
         super();
         this.header = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.header = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed8982();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 61;
      }
      
      override public function getPacketId() : int
      {
         return -1331361684;
      }
   }
}

