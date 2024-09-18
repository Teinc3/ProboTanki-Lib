package §'"f§
{
   import §&#;§.AbstractPacket;
   import projects.tanks.client.panel.model.garage.GarageItemInfo;
   
   public class §3! § extends AbstractPacket
   {
      public var items:Vector.<GarageItemInfo>;
      
      public function §3! §(param1:Vector.<GarageItemInfo> = null)
      {
         super();
         this.items = param1;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.custom.VectorCodecGarageItemInfo");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.items = param1 as Vector.<GarageItemInfo>;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §3! §();
      }
      
      override public function §package package final§() : int
      {
         return 27;
      }
      
      override public function getPacketId() : int
      {
         return -47424608;
      }
   }
}

