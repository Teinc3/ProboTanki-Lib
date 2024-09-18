package §dynamic set try§
{
   import §&#;§.AbstractPacket;
   
   public class §6#[§ extends AbstractPacket
   {
      public var §-#`§:int;
      
      public var serverSessionTime:int;
      
      public function §6#[§(param1:int = 0, param2:int = 0)
      {
         super();
         this.§-#`§ = param1;
         this.serverSessionTime = param2;
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
               this.§-#`§ = param1 as int;
               break;
            case 1:
               this.serverSessionTime = param1 as int;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §6#[§();
      }
      
      override public function §package package final§() : int
      {
         return 46;
      }
      
      override public function getPacketId() : int
      {
         return 2074243318;
      }
   }
}

