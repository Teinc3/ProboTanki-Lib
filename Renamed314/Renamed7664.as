package Renamed314
{
   import Renamed189.AbstractPacket;
   
   public class Renamed7664 extends AbstractPacket
   {
      public var rating:Number;
      
      public var place:int;
      
      public function Renamed7664(param1:Number = 0, param2:int = 0)
      {
         super();
         this.rating = param1;
         this.place = param2;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.FloatCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.rating = param1 as Number;
               break;
            case 1:
               this.place = param1 as int;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed7664();
      }
      
      override public function Renamed4883() : int
      {
         return 29;
      }
      
      override public function getPacketId() : int
      {
         return -1128606444;
      }
   }
}

