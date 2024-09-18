package Renamed323
{
   import Renamed189.AbstractPacket;
   import projects.tanks.client.panel.model.battleinvite.Renamed4321;
   
   public class Renamed5168 extends AbstractPacket
   {
      public var initParams:Renamed4321;
      
      public function Renamed5168(param1:Renamed4321 = null)
      {
         super();
         this.initParams = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecBattleInviteCC");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.initParams = param1 as Renamed4321;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed5168();
      }
      
      override public function Renamed4883() : int
      {
         return 15;
      }
      
      override public function getPacketId() : int
      {
         return 834877801;
      }
   }
}

