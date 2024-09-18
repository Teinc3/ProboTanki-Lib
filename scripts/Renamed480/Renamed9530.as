package Renamed8372
{
   import AbstractPackets.AbstractPacket;
   import projects.tanks.client.tanksservices.model.notifier.rank.RankNotifierData;
   
   public class Renamed9530 extends AbstractPacket
   {
      public var user:RankNotifierData;
      
      public function Renamed9530(param1:RankNotifierData = null)
      {
         super();
         this.user = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecRankNotifierData");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.user = param1 as RankNotifierData;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed9530();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 18;
      }
      
      override public function getPacketId() : int
      {
         return -962759489;
      }
   }
}

