package §set package native§
{
   import §&#;§.AbstractPacket;
   import §with const throw§.§^v§;
   
   public class §+v§ extends AbstractPacket
   {
      public var §-#`§:int;
      
      public var rotateTurretCommand:§^v§;
      
      public var incarnationId:int;
      
      public function §+v§(param1:int = 0, param2:§^v§ = null, param3:int = 0)
      {
         super();
         this.§-#`§ = param1;
         this.rotateTurretCommand = param2;
         this.incarnationId = param3;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecRotateTurretCommand");
         §with catch with§(param3);
         §super for switch§("scpacker.networking.protocol.codec.primitive.ShortCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.§-#`§ = param1 as int;
               break;
            case 1:
               this.rotateTurretCommand = param1 as §^v§;
               break;
            case 2:
               this.incarnationId = param1 as int;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §+v§();
      }
      
      override public function §package package final§() : int
      {
         return 39;
      }
      
      override public function getPacketId() : int
      {
         return -114968993;
      }
   }
}

