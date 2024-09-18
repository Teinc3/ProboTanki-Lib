package Renamed8372
{
   import AbstractPackets.AbstractPacket;
   import projects.tanks.client.tanksservices.model.notifier.online.OnlineNotifierData;
   
   public class Renamed9527 extends AbstractPacket
   {
      public var user:OnlineNotifierData;
      
      public function Renamed9527(param1:OnlineNotifierData = null)
      {
         super();
         this.user = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecOnlineNotifierData");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.user = param1 as OnlineNotifierData;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed9527();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 18;
      }
      
      override public function getPacketId() : int
      {
         return 2041598093;
      }
   }
}

