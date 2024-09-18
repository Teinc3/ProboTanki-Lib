package §^#L§
{
   import §&#;§.AbstractPacket;
   import platform.client.fp10.core.resource.Resource;
   
   public class §extends package false§ extends AbstractPacket
   {
      public var donation:int;
      
      public var packageBonusCrystals:int;
      
      public var bonusCrystals:int;
      
      public var image:Resource;
      
      public function §extends package false§(param1:int = 0, param2:int = 0, param3:int = 0, param4:Resource = null)
      {
         super();
         this.donation = param1;
         this.packageBonusCrystals = param2;
         this.bonusCrystals = param3;
         this.image = param4;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
         §with catch with§(param3);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
         §with catch with§(param4);
         §super for switch§("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.donation = param1 as int;
               break;
            case 1:
               this.packageBonusCrystals = param1 as int;
               break;
            case 2:
               this.bonusCrystals = param1 as int;
               break;
            case 3:
               this.image = param1 as Resource;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §extends package false§();
      }
      
      override public function §package package final§() : int
      {
         return 69;
      }
      
      override public function getPacketId() : int
      {
         return 1566424318;
      }
   }
}

