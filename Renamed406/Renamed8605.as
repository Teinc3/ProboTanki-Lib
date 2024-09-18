package Renamed406
{
   import Renamed189.AbstractPacket;
   
   public class Renamed8605 extends AbstractPacket
   {
      public var json:String;
      
      public var callbackId:int;
      
      public function Renamed8605(param1:String = "", param2:int = 0)
      {
         super();
         this.json = param1;
         this.callbackId = param2;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.json = param1 as String;
               break;
            case 1:
               this.callbackId = param1 as int;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8605();
      }
      
      override public function Renamed4883() : int
      {
         return 4;
      }
      
      override public function getPacketId() : int
      {
         return -1797047325;
      }
   }
}

