package Renamed464
{
   import Renamed189.AbstractPacket;
   
   public class Renamed2220 extends AbstractPacket
   {
      public var itemId:String;
      
      public var Renamed9289:String;
      
      public function Renamed2220(param1:String = "", param2:String = "")
      {
         super();
         this.itemId = param1;
         this.Renamed9289 = param2;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.itemId = param1 as String;
               break;
            case 1:
               this.Renamed9289 = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed2220();
      }
      
      override public function Renamed4883() : int
      {
         return 16;
      }
      
      override public function getPacketId() : int
      {
         return 880756819;
      }
   }
}

