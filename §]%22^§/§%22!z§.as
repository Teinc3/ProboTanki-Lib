package §]"^§
{
   import §&#;§.AbstractPacket;
   import projects.tanks.client.tanksservices.model.notifier.premium.PremiumNotifierData;
   
   public class §"!z§ extends AbstractPacket
   {
      public var user:PremiumNotifierData;
      
      public function §"!z§(param1:PremiumNotifierData = null)
      {
         super();
         this.user = param1;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecPremiumNotifierData");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.user = param1 as PremiumNotifierData;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §"!z§();
      }
      
      override public function §package package final§() : int
      {
         return 18;
      }
      
      override public function getPacketId() : int
      {
         return -2069508071;
      }
   }
}

