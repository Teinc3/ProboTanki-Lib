package Renamed352
{
   import Renamed189.AbstractPacket;
   
   public class Renamed4295 extends AbstractPacket
   {
      public var uid:String;
      
      public function Renamed4295(param1:String = "")
      {
         super();
         this.uid = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.uid = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed4295();
      }
      
      override public function Renamed4883() : int
      {
         return 8;
      }
      
      override public function getPacketId() : int
      {
         return -653665247;
      }
   }
}

