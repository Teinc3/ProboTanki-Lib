package §throw var include§
{
   import §&#;§.AbstractPacket;
   
   public class §if var for§ extends AbstractPacket
   {
      public var userId:String;
      
      public var newRank:int;
      
      public function §if var for§(param1:String = "", param2:int = 0)
      {
         super();
         this.userId = param1;
         this.newRank = param2;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.userId = param1 as String;
               break;
            case 1:
               this.newRank = param1 as int;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §if var for§();
      }
      
      override public function §package package final§() : int
      {
         return 37;
      }
      
      override public function getPacketId() : int
      {
         return 1262947513;
      }
   }
}

