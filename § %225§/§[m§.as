package § "5§
{
   import §&#;§.AbstractPacket;
   import projects.tanks.client.entrance.model.entrance.externalentrance.SocialNetworkEntranceParams;
   
   public class §[m§ extends AbstractPacket
   {
      public var socialNetworkParams:Vector.<SocialNetworkEntranceParams>;
      
      public function §[m§(param1:Vector.<SocialNetworkEntranceParams> = null)
      {
         super();
         this.socialNetworkParams = param1;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.custom.VectorCodecSocialNetworkEntranceParams");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.socialNetworkParams = param1 as Vector.<SocialNetworkEntranceParams>;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §[m§();
      }
      
      override public function §package package final§() : int
      {
         return 3;
      }
      
      override public function getPacketId() : int
      {
         return -1715719586;
      }
   }
}

