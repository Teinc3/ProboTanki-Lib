package Renamed7249
{
   import Renamed136.Renamed663;
   import Renamed189.AbstractPacket;
   import Renamed602.Renamed603;
   
   public class Renamed9330 extends AbstractPacket
   {
      public var position:Renamed603;
      
      public var flagTeam:Renamed663;
      
      public function Renamed9330(param1:Renamed603 = null, param2:Renamed663 = null)
      {
         super();
         this.position = param1;
         this.flagTeam = param2;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecVector3d");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecBattleTeam");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.position = param1 as Renamed603;
               break;
            case 1:
               this.flagTeam = param1 as Renamed663;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed9330();
      }
      
      override public function Renamed4883() : int
      {
         return 42;
      }
      
      override public function getPacketId() : int
      {
         return 1925237062;
      }
   }
}

