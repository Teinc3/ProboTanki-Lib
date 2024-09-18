package §set package native§
{
   import §&#;§.AbstractPacket;
   
   public class §native var default§ extends AbstractPacket
   {
      public var tankId:String;
      
      public var killerTankId:String;
      
      public var respawnDelay:int;
      
      public function §native var default§(param1:String = "", param2:String = "", param3:int = 0)
      {
         super();
         this.tankId = param1;
         this.killerTankId = param2;
         this.respawnDelay = param3;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param3);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.tankId = param1 as String;
               break;
            case 1:
               this.killerTankId = param1 as String;
               break;
            case 2:
               this.respawnDelay = param1 as int;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §native var default§();
      }
      
      override public function §package package final§() : int
      {
         return 39;
      }
      
      override public function getPacketId() : int
      {
         return -42520728;
      }
   }
}

