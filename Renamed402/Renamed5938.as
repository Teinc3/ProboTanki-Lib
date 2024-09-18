package Renamed402
{
   import Renamed189.AbstractPacket;
   
   public class Renamed5938 extends AbstractPacket
   {
      public var text:String;
      
      public function Renamed5938(param1:String = "")
      {
         super();
         this.text = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.text = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed5938();
      }
      
      override public function Renamed4883() : int
      {
         return 25;
      }
      
      override public function getPacketId() : int
      {
         return -322235316;
      }
   }
}

