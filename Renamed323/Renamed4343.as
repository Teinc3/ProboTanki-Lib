package Renamed323
{
   import Renamed189.AbstractPacket;
   
   public class Renamed4343 extends AbstractPacket
   {
      public var Renamed7746:String;
      
      public var battleId:String;
      
      public function Renamed4343(param1:String = "", param2:String = "")
      {
         super();
         this.Renamed7746 = param1;
         this.battleId = param2;
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
               this.Renamed7746 = param1 as String;
               break;
            case 1:
               this.battleId = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed4343();
      }
      
      override public function Renamed4883() : int
      {
         return 15;
      }
      
      override public function getPacketId() : int
      {
         return -864265623;
      }
   }
}

