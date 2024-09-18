package §7#z§
{
   import §&#;§.AbstractPacket;
   import projects.tanks.client.battleservice.§9"B§;
   
   public class §"!i§ extends AbstractPacket
   {
      public var params:§9"B§;
      
      public function §"!i§(param1:§9"B§ = null)
      {
         super();
         this.params = param1;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecBattleCreateParameters");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.params = param1 as §9"B§;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §"!i§();
      }
      
      override public function §package package final§() : int
      {
         return 30;
      }
      
      override public function getPacketId() : int
      {
         return -2135234426;
      }
   }
}

