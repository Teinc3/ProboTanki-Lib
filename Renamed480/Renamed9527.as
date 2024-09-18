package Renamed8372
{
   import Renamed189.AbstractPacket;
   import projects.tanks.client.tanksservices.model.notifier.online.OnlineNotifierData;
   
   public class Renamed9527 extends AbstractPacket
   {
      public var user:OnlineNotifierData;
      
      public function Renamed9527(param1:OnlineNotifierData = null)
      {
         super();
         this.user = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecOnlineNotifierData");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.user = param1 as OnlineNotifierData;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed9527();
      }
      
      override public function Renamed4883() : int
      {
         return 18;
      }
      
      override public function getPacketId() : int
      {
         return 2041598093;
      }
   }
}

