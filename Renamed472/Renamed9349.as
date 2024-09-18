package Renamed9348
{
   import Renamed136.Renamed663;
   import Renamed189.AbstractPacket;
   
   public class Renamed9349 extends AbstractPacket
   {
      public var team:Renamed663;
      
      public var score:int;
      
      public function Renamed9349(param1:Renamed663 = null, param2:int = 0)
      {
         super();
         this.team = param1;
         this.score = param2;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecBattleTeam");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.team = param1 as Renamed663;
               break;
            case 1:
               this.score = param1 as int;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed9349();
      }
      
      override public function Renamed4883() : int
      {
         return 44;
      }
      
      override public function getPacketId() : int
      {
         return 561771020;
      }
   }
}

