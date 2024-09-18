package §9#2§
{
   import §&#;§.AbstractPacket;
   import §>#m§.§5!"§;
   
   public class §!"h§ extends AbstractPacket
   {
      public var questId:int;
      
      public var newQuest:§5!"§;
      
      public function §!"h§(param1:int = 0, param2:§5!"§ = null)
      {
         super();
         this.questId = param1;
         this.newQuest = param2;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecDailyQuestInfo");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.questId = param1 as int;
               break;
            case 1:
               this.newQuest = param1 as §5!"§;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §!"h§();
      }
      
      override public function §package package final§() : int
      {
         return 19;
      }
      
      override public function getPacketId() : int
      {
         return -1266665816;
      }
   }
}

