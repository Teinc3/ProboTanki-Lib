package §]"^§
{
   import §&#;§.AbstractPacket;
   import projects.tanks.client.tanksservices.model.notifier.battle.BattleNotifierData;
   
   public class §false var dynamic§ extends AbstractPacket
   {
      public var user:BattleNotifierData;
      
      public function §false var dynamic§(param1:BattleNotifierData = null)
      {
         super();
         this.user = param1;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecBattleNotifierData");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.user = param1 as BattleNotifierData;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §false var dynamic§();
      }
      
      override public function §package package final§() : int
      {
         return 18;
      }
      
      override public function getPacketId() : int
      {
         return -1895446889;
      }
   }
}

