package Renamed436
{
   import Renamed189.AbstractPacket;
   
   public class Renamed8894 extends AbstractPacket
   {
      public var userId:String;
      
      public var newRank:int;
      
      public function Renamed8894(param1:String = "", param2:int = 0)
      {
         super();
         this.userId = param1;
         this.newRank = param2;
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
               this.userId = param1 as String;
               break;
            case 1:
               this.newRank = param1 as int;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8894();
      }
      
      override public function Renamed4883() : int
      {
         return 37;
      }
      
      override public function getPacketId() : int
      {
         return 1262947513;
      }
   }
}

