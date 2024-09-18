package Renamed284
{
   import AbstractPackets.AbstractPacket;
   import Renamed225.Renamed5522;
   
   public class Renamed7239 extends AbstractPacket
   {
      public var weeklyQuestDescription:Renamed5522;
      
      public function Renamed7239(param1:Renamed5522 = null)
      {
         super();
         this.weeklyQuestDescription = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecWeeklyQuestDescription");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.weeklyQuestDescription = param1 as Renamed5522;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed7239();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 19;
      }
      
      override public function getPacketId() : int
      {
         return 885055495;
      }
   }
}

