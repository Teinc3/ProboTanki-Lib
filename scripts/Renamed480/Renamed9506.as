package Renamed8372
{
   import AbstractPackets.AbstractPacket;
   import projects.tanks.client.tanksservices.model.notifier.premium.PremiumNotifierData;
   
   public class Renamed9505 extends AbstractPacket
   {
      public var user:PremiumNotifierData;
      
      public function Renamed9505(param1:PremiumNotifierData = null)
      {
         super();
         this.user = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecPremiumNotifierData");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.user = param1 as PremiumNotifierData;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed9505();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 18;
      }
      
      override public function getPacketId() : int
      {
         return -2069508071;
      }
   }
}

