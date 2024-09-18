package §use catch dynamic§
{
   import §&#;§.AbstractPacket;
   
   public class §set const false§ extends AbstractPacket
   {
      public var message:String;
      
      public var §7"W§:Boolean;
      
      public function §set const false§(param1:String = "", param2:Boolean = false)
      {
         super();
         this.message = param1;
         this.§7"W§ = param2;
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
               this.message = param1 as String;
               break;
            case 1:
               this.§7"W§ = param1 as Boolean;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §set const false§();
      }
      
      override public function §package package final§() : int
      {
         return 61;
      }
      
      override public function getPacketId() : int
      {
         return 945463181;
      }
   }
}

