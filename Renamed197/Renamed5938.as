package Renamed5934
{
   import Renamed189.AbstractPacket;
   import projects.tanks.client.panel.model.bonus.showing.info.BonusInfoCC;
   
   public class Renamed5938 extends AbstractPacket
   {
      public var json:String;
      
      public var bonusInfo:BonusInfoCC;
      
      public function Renamed5938(param1:String = "", param2:BonusInfoCC = null)
      {
         super();
         this.json = param1;
         this.bonusInfo = param2;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecBonusInfoCC");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
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
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed5938();
      }
      
      override public function Renamed4883() : int
      {
         return 21;
      }
      
      override public function getPacketId() : int
      {
         return 855420488;
      }
   }
}

