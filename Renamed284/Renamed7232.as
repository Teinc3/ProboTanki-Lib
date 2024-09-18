package Renamed284
{
   import AbstractPackets.AbstractPacket;
   import Renamed225.Renamed5522;
   import Renamed4808.Renamed5536;
   
   public class Renamed7232 extends AbstractPacket
   {
      public var quests:Vector.<Renamed5536>;
      
      public var weeklyQuestDescription:Renamed5522;
      
      public function Renamed7232(param1:Vector.<Renamed5536> = null, param2:Renamed5522 = null)
      {
         super();
         this.quests = param1;
         this.weeklyQuestDescription = param2;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.VectorCodecDailyQuestInfo");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecWeeklyQuestDescription");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.quests = param1 as Vector.<Renamed5536>;
               break;
            case 1:
               this.weeklyQuestDescription = param1 as Renamed5522;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed7232();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 19;
      }
      
      override public function getPacketId() : int
      {
         return 809822533;
      }
   }
}

