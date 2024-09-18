package Renamed9348
{
   import Renamed136.Renamed663;
   import Renamed189.AbstractPacket;
   import projects.tanks.client.battleservice.model.statistics.Renamed2737;
   
   public class Renamed6453 extends AbstractPacket
   {
      public var userId:String;
      
      public var usersInfo:Vector.<Renamed2737>;
      
      public var team:Renamed663;
      
      public function Renamed6453(param1:String = "", param2:Vector.<Renamed2737> = null, param3:Renamed663 = null)
      {
         super();
         this.userId = param1;
         this.usersInfo = param2;
         this.team = param3;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.custom.VectorCodecUserInfo");
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
               this.usersInfo = param1 as Vector.<Renamed2737>;
               break;
            case 2:
               this.team = param1 as Renamed663;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed6453();
      }
      
      override public function Renamed4883() : int
      {
         return 44;
      }
      
      override public function getPacketId() : int
      {
         return 2040021062;
      }
   }
}

