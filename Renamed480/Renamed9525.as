package Renamed8372
{
   import Renamed189.AbstractPacket;
   
   public class Renamed9524 extends AbstractPacket
   {
      public var user:String;
      
      public function Renamed9524(param1:String = "")
      {
         super();
         this.user = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.user = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed9524();
      }
      
      override public function Renamed4883() : int
      {
         return 18;
      }
      
      override public function getPacketId() : int
      {
         return -1353047954;
      }
   }
}

