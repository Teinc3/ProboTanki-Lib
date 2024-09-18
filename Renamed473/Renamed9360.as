package Renamed7249
{
   import Renamed136.Renamed663;
   import Renamed189.AbstractPacket;
   
   public class Renamed9360 extends AbstractPacket
   {
      public var team:Renamed663;
      
      public function Renamed9360(param1:Renamed663 = null)
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
         return new Renamed9360();
      }
      
      override public function Renamed4883() : int
      {
         return 42;
      }
      
      override public function getPacketId() : int
      {
         return -1142938284;
      }
   }
}

