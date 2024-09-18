package §break set include§
{
   import §&#;§.AbstractPacket;
   
   public class §^"p§ extends AbstractPacket
   {
      public var rank:int;
      
      public var score:int;
      
      public var currentRankScore:int;
      
      public var nextRankScore:int;
      
      public var bonusCrystals:int;
      
      public function §^"p§(param1:int = 0, param2:int = 0, param3:int = 0, param4:int = 0, param5:int = 0)
      {
         super();
         this.rank = param1;
         this.score = param2;
         this.currentRankScore = param3;
         this.nextRankScore = param4;
         this.bonusCrystals = param5;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
         §with catch with§(param3);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
         §with catch with§(param4);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
         §with catch with§(param5);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.rank = param1 as int;
               break;
            case 1:
               this.score = param1 as int;
               break;
            case 2:
               this.currentRankScore = param1 as int;
               break;
            case 3:
               this.nextRankScore = param1 as int;
               break;
            case 4:
               this.bonusCrystals = param1 as int;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §^"p§();
      }
      
      override public function §package package final§() : int
      {
         return 29;
      }
      
      override public function getPacketId() : int
      {
         return 1989173907;
      }
   }
}

