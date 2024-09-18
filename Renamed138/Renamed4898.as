package Renamed4292
{
   import Renamed189.AbstractPacket;
   import projects.tanks.client.entrance.model.entrance.externalentrance.SocialNetworkEntranceParams;
   
   public class Renamed4898 extends AbstractPacket
   {
      public var socialNetworkParams:Vector.<SocialNetworkEntranceParams>;
      
      public function Renamed4898(param1:Vector.<SocialNetworkEntranceParams> = null)
      {
         super();
         this.socialNetworkParams = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.custom.VectorCodecSocialNetworkEntranceParams");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.socialNetworkParams = param1 as Vector.<SocialNetworkEntranceParams>;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed4898();
      }
      
      override public function Renamed4883() : int
      {
         return 3;
      }
      
      override public function getPacketId() : int
      {
         return -1715719586;
      }
   }
}

