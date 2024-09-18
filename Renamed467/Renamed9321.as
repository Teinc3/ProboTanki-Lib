package Renamed467
{
   import Renamed189.AbstractPacket;
   
   public class Renamed9320 extends AbstractPacket
   {
      public var flagId:int;
      
      public var tank:String;
      
      public function Renamed9320(param1:int = 0, param2:String = "")
      {
         super();
         this.flagId = param1;
         this.tank = param2;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.flagId = param1 as int;
               break;
            case 1:
               this.tank = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed9320();
      }
      
      override public function Renamed4883() : int
      {
         return 71;
      }
      
      override public function getPacketId() : int
      {
         return 142177784;
      }
   }
}

