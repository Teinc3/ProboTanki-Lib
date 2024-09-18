package §]"^§
{
   import §&#;§.AbstractPacket;
   import projects.tanks.client.tanksservices.model.notifier.online.OnlineNotifierData;
   
   public class §override do§ extends AbstractPacket
   {
      public var user:OnlineNotifierData;
      
      public function §override do§(param1:OnlineNotifierData = null)
      {
         super();
         this.user = param1;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecOnlineNotifierData");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.user = param1 as OnlineNotifierData;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §override do§();
      }
      
      override public function §package package final§() : int
      {
         return 18;
      }
      
      override public function getPacketId() : int
      {
         return 2041598093;
      }
   }
}

