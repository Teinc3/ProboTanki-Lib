package Renamed2402
{
   import Renamed189.AbstractPacket;
   
   public class Renamed5331 extends AbstractPacket
   {
      public var bonusId:String;
      
      public function Renamed5331(param1:String = "")
      {
         super();
         this.bonusId = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.bonusId = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed5331();
      }
      
      override public function Renamed4883() : int
      {
         return 36;
      }
      
      override public function getPacketId() : int
      {
         return -1291499147;
      }
   }
}

