package Renamed390
{
   import Renamed189.AbstractPacket;
   import projects.tanks.client.battleselect.model.item.Renamed1620;
   
   public class Renamed8416 extends AbstractPacket
   {
      public var battleId:String;
      
      public var suspicionLevel:Renamed1620;
      
      public function Renamed8416(param1:String = "", param2:Renamed1620 = null)
      {
         super();
         this.battleId = param1;
         this.suspicionLevel = param2;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecBattleSuspicionLevel");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.battleId = param1 as String;
               break;
            case 1:
               this.suspicionLevel = param1 as Renamed1620;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8416();
      }
      
      override public function Renamed4883() : int
      {
         return 32;
      }
      
      override public function getPacketId() : int
      {
         return -751613832;
      }
   }
}

