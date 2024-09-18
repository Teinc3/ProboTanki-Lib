package §9#2§
{
   import §&#;§.AbstractPacket;
   import §0#W§.§&h§;
   import §>#m§.§5!"§;
   
   public class §break package switch§ extends AbstractPacket
   {
      public var quests:Vector.<§5!"§>;
      
      public var weeklyQuestDescription:§&h§;
      
      public function §break package switch§(param1:Vector.<§5!"§> = null, param2:§&h§ = null)
      {
         super();
         this.quests = param1;
         this.weeklyQuestDescription = param2;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.custom.VectorCodecDailyQuestInfo");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecWeeklyQuestDescription");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.quests = param1 as Vector.<§5!"§>;
               break;
            case 1:
               this.weeklyQuestDescription = param1 as §&h§;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §break package switch§();
      }
      
      override public function §package package final§() : int
      {
         return 19;
      }
      
      override public function getPacketId() : int
      {
         return 809822533;
      }
   }
}

