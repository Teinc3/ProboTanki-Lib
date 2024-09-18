package Renamed321
{
   import Renamed189.AbstractPacket;
   
   public class Renamed7720 extends AbstractPacket
   {
      public var code:String;
      
      public function Renamed7720(param1:String = "")
      {
         super();
         this.code = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.code = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed7720();
      }
      
      override public function Renamed4883() : int
      {
         return 5;
      }
      
      override public function getPacketId() : int
      {
         return 509394385;
      }
   }
}

