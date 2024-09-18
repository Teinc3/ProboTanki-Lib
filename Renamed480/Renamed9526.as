package Renamed8372
{
   import AbstractPackets.AbstractPacket;
   import projects.tanks.client.tanksservices.model.notifier.battle.BattleNotifierData;
   
   public class Renamed9526 extends AbstractPacket
   {
      public var user:BattleNotifierData;
      
      public function Renamed9526(param1:BattleNotifierData = null)
      {
         super();
         this.user = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecBattleNotifierData");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.user = param1 as BattleNotifierData;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed9526();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 18;
      }
      
      override public function getPacketId() : int
      {
         return -1895446889;
      }
   }
}

