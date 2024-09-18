package Renamed377
{
   import Renamed189.AbstractPacket;
   
   public class Renamed8322 extends AbstractPacket
   {
      public var battleId:String;
      
      public function Renamed8322(param1:String = "")
      {
         super();
         this.battleId = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.battleId = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8322();
      }
      
      override public function Renamed4883() : int
      {
         return 14;
      }
      
      override public function getPacketId() : int
      {
         return 1132011721;
      }
   }
}

