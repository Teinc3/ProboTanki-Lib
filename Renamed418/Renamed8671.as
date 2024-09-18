package Renamed418
{
   import Renamed189.AbstractPacket;
   
   public class Renamed8671 extends AbstractPacket
   {
      public var tank:String;
      
      public function Renamed8671(param1:String = "")
      {
         super();
         this.tank = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.tank = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8671();
      }
      
      override public function Renamed4883() : int
      {
         return 39;
      }
      
      override public function getPacketId() : int
      {
         return 1719707347;
      }
   }
}

