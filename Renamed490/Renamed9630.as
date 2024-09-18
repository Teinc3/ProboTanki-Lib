package Renamed490
{
   import Renamed189.AbstractPacket;
   
   public class Renamed9630 extends AbstractPacket
   {
      public var socialNetworkId:String;
      
      public function Renamed9630(param1:String = "")
      {
         super();
         this.socialNetworkId = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.socialNetworkId = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed9630();
      }
      
      override public function Renamed4883() : int
      {
         return 22;
      }
      
      override public function getPacketId() : int
      {
         return -1897104567;
      }
   }
}

