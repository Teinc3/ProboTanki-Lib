package §9#2§
{
   import §&#;§.AbstractPacket;
   import §0#W§.§&h§;
   
   public class §var var case§ extends AbstractPacket
   {
      public var weeklyQuestDescription:§&h§;
      
      public function §var var case§(param1:§&h§ = null)
      {
         super();
         this.weeklyQuestDescription = param1;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecWeeklyQuestDescription");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.weeklyQuestDescription = param1 as §&h§;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §var var case§();
      }
      
      override public function §package package final§() : int
      {
         return 19;
      }
      
      override public function getPacketId() : int
      {
         return 885055495;
      }
   }
}

