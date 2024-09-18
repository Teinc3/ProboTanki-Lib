package Renamed429
{
   import Renamed136.Renamed663;
   import Renamed189.AbstractPacket;
   
   public class Renamed8853 extends AbstractPacket
   {
      public var team:Renamed663;
      
      public function Renamed8853(param1:Renamed663 = null)
      {
         super();
         this.team = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecBattleTeam");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.team = param1 as Renamed663;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8853();
      }
      
      override public function Renamed4883() : int
      {
         return 60;
      }
      
      override public function getPacketId() : int
      {
         return -1701488017;
      }
   }
}

