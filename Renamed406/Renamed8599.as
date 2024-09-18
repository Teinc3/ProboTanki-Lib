package Renamed406
{
   import Renamed189.AbstractPacket;
   
   public class Renamed8598 extends AbstractPacket
   {
      public var lang:String;
      
      public function Renamed8598(param1:String = "")
      {
         super();
         this.lang = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.lang = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8598();
      }
      
      override public function Renamed4883() : int
      {
         return 4;
      }
      
      override public function getPacketId() : int
      {
         return -1864333717;
      }
   }
}

