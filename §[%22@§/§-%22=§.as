package §["@§
{
   import § !g§.§class for case§;
   import §&#;§.AbstractPacket;
   import projects.tanks.client.battleservice.model.statistics.§%q§;
   
   public class §-"=§ extends AbstractPacket
   {
      public var usersStat:§%q§;
      
      public var team:§class for case§;
      
      public function §-"=§(param1:§%q§ = null, param2:§class for case§ = null)
      {
         super();
         this.usersStat = param1;
         this.team = param2;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecUserStat");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecBattleTeam");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.usersStat = param1 as §%q§;
               break;
            case 1:
               this.team = param1 as §class for case§;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §-"=§();
      }
      
      override public function §package package final§() : int
      {
         return 44;
      }
      
      override public function getPacketId() : int
      {
         return -497293992;
      }
   }
}

