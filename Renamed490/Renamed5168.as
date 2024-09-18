package Renamed490
{
   import Renamed189.AbstractPacket;
   import projects.tanks.client.panel.model.socialnetwork.SocialNetworkPanelCC;
   
   public class Renamed5168 extends AbstractPacket
   {
      public var initParams:SocialNetworkPanelCC;
      
      public function Renamed5168(param1:SocialNetworkPanelCC = null)
      {
         super();
         this.initParams = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecSocialNetworkPanelCC");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.initParams = param1 as SocialNetworkPanelCC;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed5168();
      }
      
      override public function Renamed4883() : int
      {
         return 22;
      }
      
      override public function getPacketId() : int
      {
         return -583564465;
      }
   }
}

