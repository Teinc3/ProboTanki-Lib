package Renamed7249
{
   import Renamed136.Renamed663;
   import Renamed189.AbstractPacket;
   
   public class Renamed9322 extends AbstractPacket
   {
      public var winnerTeam:Renamed663;
      
      public var delivererTankId:String;
      
      public function Renamed9322(param1:Renamed663 = null, param2:String = "")
      {
         super();
         this.winnerTeam = param1;
         this.delivererTankId = param2;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecBattleTeam");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.winnerTeam = param1 as Renamed663;
               break;
            case 1:
               this.delivererTankId = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed9322();
      }
      
      override public function Renamed4883() : int
      {
         return 42;
      }
      
      override public function getPacketId() : int
      {
         return -1870108387;
      }
   }
}

