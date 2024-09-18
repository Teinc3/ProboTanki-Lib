package §import catch super§
{
   import §&#;§.AbstractPacket;
   
   public class §`7§ extends AbstractPacket
   {
      public var battleId:String;
      
      public var userId:String;
      
      public function §`7§(param1:String = "", param2:String = "")
      {
         super();
         this.battleId = param1;
         this.userId = param2;
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
               this.battleId = param1 as String;
               break;
            case 1:
               this.userId = param1 as String;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §`7§();
      }
      
      override public function §package package final§() : int
      {
         return 32;
      }
      
      override public function getPacketId() : int
      {
         return 504016996;
      }
   }
}

