package Renamed377
{
   import Renamed189.AbstractPacket;
   
   public class Renamed7448 extends AbstractPacket
   {
      public var link:String;
      
      public function Renamed7448(param1:String = "")
      {
         super();
         this.link = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.link = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed7448();
      }
      
      override public function Renamed4883() : int
      {
         return 14;
      }
      
      override public function getPacketId() : int
      {
         return -604091695;
      }
   }
}

