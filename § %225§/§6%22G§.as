package § "5§
{
   import §&#;§.AbstractPacket;
   
   public class §6"G§ extends AbstractPacket
   {
      public var login:String;
      
      public var password:String;
      
      public function §6"G§(param1:String = "", param2:String = "")
      {
         super();
         this.login = param1;
         this.password = param2;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.login = param1 as String;
               break;
            case 1:
               this.password = param1 as String;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §6"G§();
      }
      
      override public function §package package final§() : int
      {
         return 3;
      }
      
      override public function getPacketId() : int
      {
         return -87665118;
      }
   }
}

