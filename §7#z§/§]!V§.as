package §7#z§
{
   import §&#;§.AbstractPacket;
   
   public class §]!V§ extends AbstractPacket
   {
      public var battleName:String;
      
      public function §]!V§(param1:String = "")
      {
         super();
         this.battleName = param1;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.battleName = param1 as String;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §]!V§();
      }
      
      override public function §package package final§() : int
      {
         return 30;
      }
      
      override public function getPacketId() : int
      {
         return 566652736;
      }
   }
}

