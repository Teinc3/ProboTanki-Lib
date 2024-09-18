package §["t§
{
   import § !g§.§class for case§;
   import §&#;§.AbstractPacket;
   
   public class §<Q§ extends AbstractPacket
   {
      public var flagTeam:§class for case§;
      
      public var tank:String;
      
      public function §<Q§(param1:§class for case§ = null, param2:String = "")
      {
         super();
         this.flagTeam = param1;
         this.tank = param2;
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
               this.flagTeam = param1 as §class for case§;
               break;
            case 1:
               this.tank = param1 as String;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §<Q§();
      }
      
      override public function §package package final§() : int
      {
         return 42;
      }
      
      override public function getPacketId() : int
      {
         return -1026428589;
      }
   }
}

