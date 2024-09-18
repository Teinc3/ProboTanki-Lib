package §'" §
{
   import §&#;§.AbstractPacket;
   import projects.tanks.client.panel.model.bonus.showing.info.BonusInfoCC;
   
   public class §6#,§ extends AbstractPacket
   {
      public var json:String;
      
      public var bonusInfo:BonusInfoCC;
      
      public function §6#,§(param1:String = "", param2:BonusInfoCC = null)
      {
         super();
         this.json = param1;
         this.bonusInfo = param2;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecBonusInfoCC");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.json = param1 as String;
               break;
            case 1:
               this.bonusInfo = param1 as BonusInfoCC;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §6#,§();
      }
      
      override public function §package package final§() : int
      {
         return 21;
      }
      
      override public function getPacketId() : int
      {
         return 855420488;
      }
   }
}

