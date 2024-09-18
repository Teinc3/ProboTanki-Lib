package Renamed8372
{
   import Renamed189.AbstractPacket;
   import projects.tanks.client.tanksservices.model.notifier.battle.BattleNotifierData;
   
   public class Renamed9526 extends AbstractPacket
   {
      public var user:BattleNotifierData;
      
      public function Renamed9526(param1:BattleNotifierData = null)
      {
         super();
         this.user = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecBattleNotifierData");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.user = param1 as BattleNotifierData;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed9526();
      }
      
      override public function Renamed4883() : int
      {
         return 18;
      }
      
      override public function getPacketId() : int
      {
         return -1895446889;
      }
   }
}

