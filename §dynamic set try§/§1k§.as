package §dynamic set try§
{
   import §&#;§.AbstractPacket;
   
   public class §1k§ extends AbstractPacket
   {
      public var serverSessionTime:int;
      
      public var clientPing:int;
      
      public function §1k§(param1:int = 0, param2:int = 0)
      {
         super();
         this.serverSessionTime = param1;
         this.clientPing = param2;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.serverSessionTime = param1 as int;
               break;
            case 1:
               this.clientPing = param1 as int;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §1k§();
      }
      
      override public function §package package final§() : int
      {
         return 46;
      }
      
      override public function getPacketId() : int
      {
         return 34068208;
      }
   }
}

