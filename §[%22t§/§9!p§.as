package §["t§
{
   import § !g§.§class for case§;
   import §&#;§.AbstractPacket;
   import §;"?§.§#">§;
   
   public class §9!p§ extends AbstractPacket
   {
      public var position:§#">§;
      
      public var flagTeam:§class for case§;
      
      public function §9!p§(param1:§#">§ = null, param2:§class for case§ = null)
      {
         super();
         this.position = param1;
         this.flagTeam = param2;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecVector3d");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecBattleTeam");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.position = param1 as §#">§;
               break;
            case 1:
               this.flagTeam = param1 as §class for case§;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §9!p§();
      }
      
      override public function §package package final§() : int
      {
         return 42;
      }
      
      override public function getPacketId() : int
      {
         return 1925237062;
      }
   }
}

