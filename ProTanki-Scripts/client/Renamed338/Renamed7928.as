package Renamed338
{
   import AbstractPackets.AbstractPacket;
   import Renamed331.Renamed1906;
   
   public class Renamed7928 extends AbstractPacket
   {
      public var weeklyQuestReward:Vector.<Renamed1906>;
      
      public function Renamed7928(param1:Vector.<Renamed1906> = null)
      {
         super();
         this.weeklyQuestReward = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.VectorCodecWeeklyQuestRewardItem");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.weeklyQuestReward = param1 as Vector.<Renamed1906>;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed7928();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 20;
      }
      
      override public function getPacketId() : int
      {
         return 1711371907;
      }
   }
}

