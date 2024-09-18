package Renamed425
{
   import Renamed189.AbstractPacket;
   
   public class Renamed6631 extends AbstractPacket
   {
      public var email:String;
      
      public function Renamed6631(param1:String = "")
      {
         super();
         this.email = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.email = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed6631();
      }
      
      override public function Renamed4883() : int
      {
         return 24;
      }
      
      override public function getPacketId() : int
      {
         return -20486732;
      }
   }
}

