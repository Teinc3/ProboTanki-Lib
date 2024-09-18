package §>"O§
{
   import §&#;§.AbstractPacket;
   
   public class §1! § extends AbstractPacket
   {
      public var item:String;
      
      public var §]#j§:int;
      
      public function §1! §(param1:String = "", param2:int = 0)
      {
         super();
         this.item = param1;
         this.§]#j§ = param2;
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
               this.item = param1 as String;
               break;
            case 1:
               this.§]#j§ = param1 as int;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §1! §();
      }
      
      override public function §package package final§() : int
      {
         return 34;
      }
      
      override public function getPacketId() : int
      {
         return -523392052;
      }
   }
}

