package Renamed442
{
   import Renamed189.AbstractPacket;
   
   public class Renamed4253 extends AbstractPacket
   {
      public var Renamed8942:String;
      
      public var text:String;
      
      public function Renamed4253(param1:String = "", param2:String = "")
      {
         super();
         this.Renamed8942 = param1;
         this.text = param2;
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
               this.Renamed8942 = param1 as String;
               break;
            case 1:
               this.text = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed4253();
      }
      
      override public function Renamed4883() : int
      {
         return 28;
      }
      
      override public function getPacketId() : int
      {
         return 705454610;
      }
   }
}

