package Renamed4312
{
   import Renamed189.AbstractPacket;
   
   public class Renamed4315 extends AbstractPacket
   {
      public var item:String;
      
      public var Renamed5552:int;
      
      public function Renamed4315(param1:String = "", param2:int = 0)
      {
         super();
         this.item = param1;
         this.Renamed5552 = param2;
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
               this.item = param1 as String;
               break;
            case 1:
               this.Renamed5552 = param1 as int;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed4315();
      }
      
      override public function Renamed4883() : int
      {
         return 34;
      }
      
      override public function getPacketId() : int
      {
         return -523392052;
      }
   }
}

