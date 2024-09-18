package Renamed314
{
   import Renamed189.AbstractPacket;
   
   public class Renamed7666 extends AbstractPacket
   {
      public var rank:int;
      
      public var score:int;
      
      public var currentRankScore:int;
      
      public var nextRankScore:int;
      
      public var bonusCrystals:int;
      
      public function Renamed7666(param1:int = 0, param2:int = 0, param3:int = 0, param4:int = 0, param5:int = 0)
      {
         super();
         this.rank = param1;
         this.score = param2;
         this.currentRankScore = param3;
         this.nextRankScore = param4;
         this.bonusCrystals = param5;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
         Renamed1258(param3);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
         Renamed1258(param4);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
         Renamed1258(param5);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.rank = param1 as int;
               break;
            case 1:
               this.score = param1 as int;
               break;
            case 2:
               this.currentRankScore = param1 as int;
               break;
            case 3:
               this.nextRankScore = param1 as int;
               break;
            case 4:
               this.bonusCrystals = param1 as int;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed7666();
      }
      
      override public function Renamed4883() : int
      {
         return 29;
      }
      
      override public function getPacketId() : int
      {
         return 1989173907;
      }
   }
}

