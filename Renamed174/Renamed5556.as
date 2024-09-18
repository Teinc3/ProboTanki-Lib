package Renamed4312
{
   import Renamed189.AbstractPacket;
   
   public class Renamed5555 extends AbstractPacket
   {
      public var itemId:String;
      
      public var mounted:Boolean;
      
      public function Renamed5555(param1:String = "", param2:Boolean = false)
      {
         super();
         this.itemId = param1;
         this.mounted = param2;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.itemId = param1 as String;
               break;
            case 1:
               this.mounted = param1 as Boolean;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed5555();
      }
      
      override public function Renamed4883() : int
      {
         return 34;
      }
      
      override public function getPacketId() : int
      {
         return 2062201643;
      }
   }
}

