package Renamed268
{
   import Renamed189.AbstractPacket;
   import projects.tanks.client.battleservice.Renamed1579;
   
   public class Renamed4169 extends AbstractPacket
   {
      public var params:Renamed1579;
      
      public function Renamed4169(param1:Renamed1579 = null)
      {
         super();
         this.params = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecBattleCreateParameters");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.params = param1 as Renamed1579;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed4169();
      }
      
      override public function Renamed4883() : int
      {
         return 30;
      }
      
      override public function getPacketId() : int
      {
         return -2135234426;
      }
   }
}

