package Renamed5154
{
   import Renamed189.AbstractPacket;
   
   public class Renamed5167 extends AbstractPacket
   {
      public var itemId:String;
      
      public var count:int;
      
      public function Renamed5167(param1:String = "", param2:int = 0)
      {
         super();
         this.itemId = param1;
         this.count = param2;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.itemId = param1 as String;
               break;
            case 1:
               this.count = param1 as int;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed5167();
      }
      
      override public function Renamed4883() : int
      {
         return 43;
      }
      
      override public function getPacketId() : int
      {
         return -502907094;
      }
   }
}

