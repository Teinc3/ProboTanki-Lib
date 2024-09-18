package §["t§
{
   import § !g§.§class for case§;
   import §&#;§.AbstractPacket;
   
   public class §throw package include§ extends AbstractPacket
   {
      public var tankId:String;
      
      public var flagTeam:§class for case§;
      
      public function §throw package include§(param1:String = "", param2:§class for case§ = null)
      {
         super();
         this.tankId = param1;
         this.flagTeam = param2;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecBattleTeam");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.tankId = param1 as String;
               break;
            case 1:
               this.flagTeam = param1 as §class for case§;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §throw package include§();
      }
      
      override public function §package package final§() : int
      {
         return 42;
      }
      
      override public function getPacketId() : int
      {
         return -1282406496;
      }
   }
}

