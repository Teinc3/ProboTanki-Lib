package Renamed448
{
   import Renamed189.AbstractPacket;
   
   public class Renamed8982 extends AbstractPacket
   {
      public var header:String;
      
      public function Renamed8982(param1:String = "")
      {
         super();
         this.header = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.header = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8982();
      }
      
      override public function Renamed4883() : int
      {
         return 61;
      }
      
      override public function getPacketId() : int
      {
         return -1331361684;
      }
   }
}

