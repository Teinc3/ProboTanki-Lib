package §0H§
{
   import §&#;§.AbstractPacket;
   import projects.tanks.client.battleservice.model.statistics.§%q§;
   
   public class §-"=§ extends AbstractPacket
   {
      public var usersStat:§%q§;
      
      public function §-"=§(param1:§%q§ = null)
      {
         super();
         this.usersStat = param1;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecUserStat");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.usersStat = param1 as §%q§;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §-"=§();
      }
      
      override public function §package package final§() : int
      {
         return 48;
      }
      
      override public function getPacketId() : int
      {
         return 696140460;
      }
   }
}

