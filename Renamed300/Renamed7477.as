package Renamed300
{
   import Renamed189.AbstractPacket;
   
   public class Renamed7476 extends AbstractPacket
   {
      public var currentEmail:String;
      
      public function Renamed7476(param1:String = "")
      {
         super();
         this.currentEmail = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.currentEmail = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed7476();
      }
      
      override public function Renamed4883() : int
      {
         return 9;
      }
      
      override public function getPacketId() : int
      {
         return -2118900410;
      }
   }
}

