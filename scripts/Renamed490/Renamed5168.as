package Renamed490
{
   import AbstractPackets.AbstractPacket;
   import projects.tanks.client.panel.model.socialnetwork.SocialNetworkPanelCC;
   
   public class Renamed5168 extends AbstractPacket
   {
      public var initParams:SocialNetworkPanelCC;
      
      public function Renamed5168(param1:SocialNetworkPanelCC = null)
      {
         super();
         this.initParams = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecSocialNetworkPanelCC");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.initParams = param1 as SocialNetworkPanelCC;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed5168();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 22;
      }
      
      override public function getPacketId() : int
      {
         return -583564465;
      }
   }
}

