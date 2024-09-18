package Renamed300
{
   import Renamed189.AbstractPacket;
   
   public class Renamed6198 extends AbstractPacket
   {
      public var Renamed7480:String;
      
      public var Renamed7481:String;
      
      public function Renamed6198(param1:String = "", param2:String = "")
      {
         super();
         this.Renamed7480 = param1;
         this.Renamed7481 = param2;
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
               this.Renamed7480 = param1 as String;
               break;
            case 1:
               this.Renamed7481 = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed6198();
      }
      
      override public function Renamed4883() : int
      {
         return 9;
      }
      
      override public function getPacketId() : int
      {
         return 762959326;
      }
   }
}

