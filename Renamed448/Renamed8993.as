package Renamed448
{
   import Renamed136.Renamed663;
   import Renamed189.AbstractPacket;
   
   public class Renamed8993 extends AbstractPacket
   {
      public var userId:String;
      
      public var message:String;
      
      public var team:Renamed663;
      
      public function Renamed8993(param1:String = "", param2:String = "", param3:Renamed663 = null)
      {
         super();
         this.userId = param1;
         this.message = param2;
         this.team = param3;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param3);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecBattleTeam");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.userId = param1 as String;
               break;
            case 1:
               this.message = param1 as String;
               break;
            case 2:
               this.team = param1 as Renamed663;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8993();
      }
      
      override public function Renamed4883() : int
      {
         return 61;
      }
      
      override public function getPacketId() : int
      {
         return 1259981343;
      }
   }
}

