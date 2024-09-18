package §[#,§
{
   import §&#;§.AbstractPacket;
   
   public class §=G§ extends AbstractPacket
   {
      public var §-#`§:int;
      
      public var barrel:int;
      
      public function §=G§(param1:int = 0, param2:int = 0)
      {
         super();
         this.§-#`§ = param1;
         this.barrel = param2;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.ByteCodec");
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
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §=G§();
      }
      
      override public function §package package final§() : int
      {
         return 51;
      }
      
      override public function getPacketId() : int
      {
         return -1805942142;
      }
   }
}

