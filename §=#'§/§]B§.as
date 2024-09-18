package §=#'§
{
   import §&#;§.AbstractPacket;
   
   public class §]B§ extends AbstractPacket
   {
      public var success:Boolean;
      
      public var error:String;
      
      public function §]B§(param1:Boolean = false, param2:String = "")
      {
         super();
         this.success = param1;
         this.error = param2;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.success = param1 as Boolean;
               break;
            case 1:
               this.error = param1 as String;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §]B§();
      }
      
      override public function §package package final§() : int
      {
         return 9;
      }
      
      override public function getPacketId() : int
      {
         return 1570555748;
      }
   }
}

