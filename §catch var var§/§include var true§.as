package §catch var var§
{
   import §&#;§.AbstractPacket;
   
   public class §include var true§ extends AbstractPacket
   {
      public var lifeTimeInSecondsFromCurrentDateTime:int;
      
      public var crystalBonusInPercent:int;
      
      public var scoreBonusInPercent:int;
      
      public function §include var true§(param1:int = 0, param2:int = 0, param3:int = 0)
      {
         super();
         this.lifeTimeInSecondsFromCurrentDateTime = param1;
         this.crystalBonusInPercent = param2;
         this.scoreBonusInPercent = param3;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
         §with catch with§(param3);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.lifeTimeInSecondsFromCurrentDateTime = param1 as int;
               break;
            case 1:
               this.crystalBonusInPercent = param1 as int;
               break;
            case 2:
               this.scoreBonusInPercent = param1 as int;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §include var true§();
      }
      
      override public function §package package final§() : int
      {
         return 72;
      }
      
      override public function getPacketId() : int
      {
         return 29211250;
      }
   }
}

