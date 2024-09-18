package §throw var include§
{
   import §&#;§.AbstractPacket;
   
   public class §-!3§ extends AbstractPacket
   {
      public var userId:String;
      
      public var suspicious:Boolean;
      
      public function §-!3§(param1:String = "", param2:Boolean = false)
      {
         super();
         this.userId = param1;
         this.suspicious = param2;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.userId = param1 as String;
               break;
            case 1:
               this.suspicious = param1 as Boolean;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §-!3§();
      }
      
      override public function §package package final§() : int
      {
         return 37;
      }
      
      override public function getPacketId() : int
      {
         return 446781737;
      }
   }
}

