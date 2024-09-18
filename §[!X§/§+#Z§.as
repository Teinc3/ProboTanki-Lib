package §[!X§
{
   import §&#;§.AbstractPacket;
   
   public class §+#Z§ extends AbstractPacket
   {
      public var flagId:int;
      
      public var baseId:int;
      
      public var delivererTankId:String;
      
      public function §+#Z§(param1:int = 0, param2:int = 0, param3:String = "")
      {
         super();
         this.flagId = param1;
         this.baseId = param2;
         this.delivererTankId = param3;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
         §with catch with§(param3);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.flagId = param1 as int;
               break;
            case 1:
               this.baseId = param1 as int;
               break;
            case 2:
               this.delivererTankId = param1 as String;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §+#Z§();
      }
      
      override public function §package package final§() : int
      {
         return 71;
      }
      
      override public function getPacketId() : int
      {
         return 1941352088;
      }
   }
}

