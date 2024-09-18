package §finally each§
{
   import §&#;§.AbstractPacket;
   import §static final§.§continue package do§;
   
   public class §static for use§ extends AbstractPacket
   {
      public var data:Vector.<§continue package do§>;
      
      public var inviteLink:String;
      
      public var banner:String;
      
      public var inviteMessage:String;
      
      public function §static for use§(param1:Vector.<§continue package do§> = null, param2:String = "", param3:String = "", param4:String = "")
      {
         super();
         this.data = param1;
         this.inviteLink = param2;
         this.banner = param3;
         this.inviteMessage = param4;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.custom.VectorCodecReferrerIncomeData");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param3);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param4);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.data = param1 as Vector.<§continue package do§>;
               break;
            case 1:
               this.inviteLink = param1 as String;
               break;
            case 2:
               this.banner = param1 as String;
               break;
            case 3:
               this.inviteMessage = param1 as String;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §static for use§();
      }
      
      override public function §package package final§() : int
      {
         return 76;
      }
      
      override public function getPacketId() : int
      {
         return 1587315905;
      }
   }
}

