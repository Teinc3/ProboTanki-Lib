package §]"^§
{
   import §&#;§.AbstractPacket;
   import projects.tanks.client.tanksservices.model.notifier.rank.RankNotifierData;
   
   public class §`T§ extends AbstractPacket
   {
      public var user:RankNotifierData;
      
      public function §`T§(param1:RankNotifierData = null)
      {
         super();
         this.user = param1;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecRankNotifierData");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.user = param1 as RankNotifierData;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §`T§();
      }
      
      override public function §package package final§() : int
      {
         return 18;
      }
      
      override public function getPacketId() : int
      {
         return -962759489;
      }
   }
}

