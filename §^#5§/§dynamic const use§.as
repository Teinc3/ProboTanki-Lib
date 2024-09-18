package §^#5§
{
   import §&#;§.AbstractPacket;
   import projects.tanks.client.panel.model.socialnetwork.SocialNetworkPanelCC;
   
   public class §dynamic const use§ extends AbstractPacket
   {
      public var initParams:SocialNetworkPanelCC;
      
      public function §dynamic const use§(param1:SocialNetworkPanelCC = null)
      {
         super();
         this.initParams = param1;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecSocialNetworkPanelCC");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.initParams = param1 as SocialNetworkPanelCC;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §dynamic const use§();
      }
      
      override public function §package package final§() : int
      {
         return 22;
      }
      
      override public function getPacketId() : int
      {
         return -583564465;
      }
   }
}

