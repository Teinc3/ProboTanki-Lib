package Renamed418
{
   import Renamed189.AbstractPacket;
   
   public class Renamed8674 extends AbstractPacket
   {
      public var tankId:String;
      
      public var effectId:int;
      
      public function Renamed8674(param1:String = "", param2:int = 0)
      {
         super();
         this.tankId = param1;
         this.effectId = param2;
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
               this.tankId = param1 as String;
               break;
            case 1:
               this.effectId = param1 as int;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8674();
      }
      
      override public function Renamed4883() : int
      {
         return 39;
      }
      
      override public function getPacketId() : int
      {
         return -1994318624;
      }
   }
}

