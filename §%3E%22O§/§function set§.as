package §>"O§
{
   import §&#;§.AbstractPacket;
   
   public class §function set§ extends AbstractPacket
   {
      public var §try const§:String;
      
      public var §+#b§:String;
      
      public var text:String;
      
      public var §]#j§:int;
      
      public function §function set§(param1:String = "", param2:String = "", param3:String = "", param4:int = 0)
      {
         super();
         this.§try const§ = param1;
         this.§+#b§ = param2;
         this.text = param3;
         this.§]#j§ = param4;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param3);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param4);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.§try const§ = param1 as String;
               break;
            case 1:
               this.§+#b§ = param1 as String;
               break;
            case 2:
               this.text = param1 as String;
               break;
            case 3:
               this.§]#j§ = param1 as int;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §function set§();
      }
      
      override public function §package package final§() : int
      {
         return 34;
      }
      
      override public function getPacketId() : int
      {
         return -1518850075;
      }
   }
}

