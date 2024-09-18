package §set package native§
{
   import §&#;§.AbstractPacket;
   import §with const throw§.§["R§;
   
   public class §!#s§ extends AbstractPacket
   {
      public var §-#`§:int;
      
      public var specificationId:int;
      
      public var moveCommand:§["R§;
      
      public function §!#s§(param1:int = 0, param2:int = 0, param3:§["R§ = null)
      {
         super();
         this.§-#`§ = param1;
         this.specificationId = param2;
         this.moveCommand = param3;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.ShortCodec");
         §with catch with§(param3);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecMoveCommand");
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
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §!#s§();
      }
      
      override public function §package package final§() : int
      {
         return 39;
      }
      
      override public function getPacketId() : int
      {
         return 329279865;
      }
   }
}

