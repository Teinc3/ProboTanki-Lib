package §[#,§
{
   import §&#;§.AbstractPacket;
   import §;"?§.§#">§;
   
   public class §+#2§ extends AbstractPacket
   {
      public var §-#`§:int;
      
      public var barrel:int;
      
      public var shotId:int;
      
      public var shotDirection:§#">§;
      
      public function §+#2§(param1:int = 0, param2:int = 0, param3:int = 0, param4:§#">§ = null)
      {
         super();
         this.§-#`§ = param1;
         this.barrel = param2;
         this.shotId = param3;
         this.shotDirection = param4;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.ByteCodec");
         §with catch with§(param3);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
         §with catch with§(param4);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecVector3d");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.§-#`§ = param1 as int;
               break;
            case 1:
               this.barrel = param1 as int;
               break;
            case 2:
               this.shotId = param1 as int;
               break;
            case 3:
               this.shotDirection = param1 as §#">§;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §+#2§();
      }
      
      override public function §package package final§() : int
      {
         return 51;
      }
      
      override public function getPacketId() : int
      {
         return -159686980;
      }
   }
}

