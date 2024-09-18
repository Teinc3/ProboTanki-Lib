package Renamed464
{
   import Renamed189.AbstractPacket;
   
   public class Renamed9280 extends AbstractPacket
   {
      public var url:String;
      
      public function Renamed9280(param1:String = "")
      {
         super();
         this.url = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.url = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed9280();
      }
      
      override public function Renamed4883() : int
      {
         return 16;
      }
      
      override public function getPacketId() : int
      {
         return -1455955413;
      }
   }
}

