package Renamed442
{
   import Renamed189.AbstractPacket;
   
   public class Renamed8935 extends AbstractPacket
   {
      public var uid:String;
      
      public function Renamed8935(param1:String = "")
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
         return new Renamed8935();
      }
      
      override public function Renamed4883() : int
      {
         return 28;
      }
      
      override public function getPacketId() : int
      {
         return 1993050216;
      }
   }
}

