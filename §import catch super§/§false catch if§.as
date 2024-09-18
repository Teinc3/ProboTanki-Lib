package §import catch super§
{
   import §&#;§.AbstractPacket;
   import projects.tanks.client.battleselect.model.item.§5!9§;
   
   public class §false catch if§ extends AbstractPacket
   {
      public var battleId:String;
      
      public var suspicionLevel:§5!9§;
      
      public function §false catch if§(param1:String = "", param2:§5!9§ = null)
      {
         super();
         this.battleId = param1;
         this.suspicionLevel = param2;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecBattleSuspicionLevel");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.battleId = param1 as String;
               break;
            case 1:
               this.suspicionLevel = param1 as §5!9§;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §false catch if§();
      }
      
      override public function §package package final§() : int
      {
         return 32;
      }
      
      override public function getPacketId() : int
      {
         return -751613832;
      }
   }
}

