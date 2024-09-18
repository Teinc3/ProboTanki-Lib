package Renamed205
{
   import Renamed189.AbstractPacket;
   
   public class Renamed6089 extends AbstractPacket
   {
      public var Renamed2256:String;
      
      public function Renamed6089(param1:String = "")
      {
         super();
         this.Renamed2256 = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.Renamed2256 = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed6089();
      }
      
      override public function Renamed4883() : int
      {
         return 75;
      }
      
      override public function getPacketId() : int
      {
         return 921004371;
      }
   }
}

