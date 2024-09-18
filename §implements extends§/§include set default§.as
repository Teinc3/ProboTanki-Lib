package §implements extends§
{
   import §&#;§.AbstractPacket;
   
   public class §include set default§ extends AbstractPacket
   {
      public var enabled:Boolean;
      
      public function §include set default§(param1:Boolean = false)
      {
         super();
         this.enabled = param1;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.enabled = param1 as Boolean;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §include set default§();
      }
      
      override public function §package package final§() : int
      {
         return 10;
      }
      
      override public function getPacketId() : int
      {
         return 150222118;
      }
   }
}

