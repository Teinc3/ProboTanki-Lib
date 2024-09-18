package §set package native§
{
   import §&#;§.AbstractPacket;
   import §with const throw§.§["R§;
   
   public class §try throw§ extends AbstractPacket
   {
      public var §-#`§:int;
      
      public var specificationId:int;
      
      public var moveCommand:§["R§;
      
      public var turretDirection:Number;
      
      public function §try throw§(param1:int = 0, param2:int = 0, param3:§["R§ = null, param4:Number = 0)
      {
         super();
         this.§-#`§ = param1;
         this.specificationId = param2;
         this.moveCommand = param3;
         this.turretDirection = param4;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.ShortCodec");
         §with catch with§(param3);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecMoveCommand");
         §with catch with§(param4);
         §super for switch§("scpacker.networking.protocol.codec.primitive.FloatCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.§-#`§ = param1 as int;
               break;
            case 1:
               this.specificationId = param1 as int;
               break;
            case 2:
               this.moveCommand = param1 as §["R§;
               break;
            case 3:
               this.turretDirection = param1 as Number;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §try throw§();
      }
      
      override public function §package package final§() : int
      {
         return 39;
      }
      
      override public function getPacketId() : int
      {
         return -1683279062;
      }
   }
}

