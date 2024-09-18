package §["t§
{
   import § !g§.§class for case§;
   import §&#;§.AbstractPacket;
   
   public class §+#Z§ extends AbstractPacket
   {
      public var winnerTeam:§class for case§;
      
      public var delivererTankId:String;
      
      public function §+#Z§(param1:§class for case§ = null, param2:String = "")
      {
         super();
         this.winnerTeam = param1;
         this.delivererTankId = param2;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecBattleTeam");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.winnerTeam = param1 as §class for case§;
               break;
            case 1:
               this.delivererTankId = param1 as String;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §+#Z§();
      }
      
      override public function §package package final§() : int
      {
         return 42;
      }
      
      override public function getPacketId() : int
      {
         return -1870108387;
      }
   }
}

