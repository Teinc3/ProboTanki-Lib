package Renamed284
{
   import Renamed189.AbstractPacket;
   import Renamed4808.Renamed5536;
   
   public class Renamed7215 extends AbstractPacket
   {
      public var questId:int;
      
      public var newQuest:Renamed5536;
      
      public function Renamed7215(param1:int = 0, param2:Renamed5536 = null)
      {
         super();
         this.questId = param1;
         this.newQuest = param2;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecDailyQuestInfo");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.questId = param1 as int;
               break;
            case 1:
               this.newQuest = param1 as Renamed5536;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed7215();
      }
      
      override public function Renamed4883() : int
      {
         return 19;
      }
      
      override public function getPacketId() : int
      {
         return -1266665816;
      }
   }
}

