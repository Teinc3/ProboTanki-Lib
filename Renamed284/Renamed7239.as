package Renamed284
{
   import Renamed189.AbstractPacket;
   import Renamed225.Renamed5522;
   
   public class Renamed7239 extends AbstractPacket
   {
      public var weeklyQuestDescription:Renamed5522;
      
      public function Renamed7239(param1:Renamed5522 = null)
      {
         super();
         this.weeklyQuestDescription = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecWeeklyQuestDescription");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.weeklyQuestDescription = param1 as Renamed5522;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed7239();
      }
      
      override public function Renamed4883() : int
      {
         return 19;
      }
      
      override public function getPacketId() : int
      {
         return 885055495;
      }
   }
}

