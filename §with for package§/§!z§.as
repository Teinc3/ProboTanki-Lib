package §with for package§
{
   import §&#;§.AbstractPacket;
   
   public class §!z§ extends AbstractPacket
   {
      public var tank:String;
      
      public var respawnDelay:int;
      
      public function §!z§(param1:String = "", param2:int = 0)
      {
         super();
         this.tank = param1;
         this.respawnDelay = param2;
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
               this.tank = param1 as String;
               break;
            case 1:
               this.respawnDelay = param1 as int;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §!z§();
      }
      
      override public function §package package final§() : int
      {
         return 59;
      }
      
      override public function getPacketId() : int
      {
         return -173682854;
      }
   }
}

