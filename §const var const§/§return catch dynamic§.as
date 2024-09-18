package §const var const§
{
   import §&#;§.AbstractPacket;
   import §class const var§.§6z§;
   
   public class §return catch dynamic§ extends AbstractPacket
   {
      public var weeklyQuestReward:Vector.<§6z§>;
      
      public function §return catch dynamic§(param1:Vector.<§6z§> = null)
      {
         super();
         this.weeklyQuestReward = param1;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.custom.VectorCodecWeeklyQuestRewardItem");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.weeklyQuestReward = param1 as Vector.<§6z§>;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §return catch dynamic§();
      }
      
      override public function §package package final§() : int
      {
         return 20;
      }
      
      override public function getPacketId() : int
      {
         return 1711371907;
      }
   }
}

