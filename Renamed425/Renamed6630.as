package Renamed425
{
   import Renamed189.AbstractPacket;
   
   public class Renamed6630 extends AbstractPacket
   {
      public var Renamed7495:String;
      
      public var password:String;
      
      public function Renamed6630(param1:String = "", param2:String = "")
      {
         super();
         this.Renamed7495 = param1;
         this.password = param2;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.Renamed7495 = param1 as String;
               break;
            case 1:
               this.password = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed6630();
      }
      
      override public function Renamed4883() : int
      {
         return 24;
      }
      
      override public function getPacketId() : int
      {
         return 668890771;
      }
   }
}

