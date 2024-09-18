package Renamed4312
{
   import Renamed189.AbstractPacket;
   
   public class Renamed4168 extends AbstractPacket
   {
      public var itemId:String;
      
      public function Renamed4168(param1:String = "")
      {
         super();
         this.itemId = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.itemId = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed4168();
      }
      
      override public function Renamed4883() : int
      {
         return 34;
      }
      
      override public function getPacketId() : int
      {
         return -803365239;
      }
   }
}

