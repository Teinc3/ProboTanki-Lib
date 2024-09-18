package Renamed5154
{
   import Renamed189.AbstractPacket;
   
   public class Renamed5155 extends AbstractPacket
   {
      public var itemId:String;
      
      public var time:int;
      
      public var decrease:Boolean;
      
      public function Renamed5155(param1:String = "", param2:int = 0, param3:Boolean = false)
      {
         super();
         this.itemId = param1;
         this.time = param2;
         this.decrease = param3;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
         Renamed1258(param3);
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
               this.time = param1 as int;
               break;
            case 2:
               this.decrease = param1 as Boolean;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed5155();
      }
      
      override public function Renamed4883() : int
      {
         return 43;
      }
      
      override public function getPacketId() : int
      {
         return 2032104949;
      }
   }
}

