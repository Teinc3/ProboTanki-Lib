package Renamed418
{
   import Renamed136.Renamed663;
   import Renamed189.AbstractPacket;
   import Renamed602.Renamed603;
   
   public class Renamed8705 extends AbstractPacket
   {
      public var tankId:String;
      
      public var team:Renamed663;
      
      public var position:Renamed603;
      
      public var orientation:Renamed603;
      
      public var health:int;
      
      public var incarnationId:int;
      
      public function Renamed8705(param1:String = "", param2:Renamed663 = null, param3:Renamed603 = null, param4:Renamed603 = null, param5:int = 0, param6:int = 0)
      {
         super();
         this.tankId = param1;
         this.team = param2;
         this.position = param3;
         this.orientation = param4;
         this.health = param5;
         this.incarnationId = param6;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecBattleTeam");
         Renamed1258(param3);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecVector3d");
         Renamed1258(param4);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecVector3d");
         Renamed1258(param5);
         Renamed4880("scpacker.networking.protocol.codec.primitive.ShortCodec");
         Renamed1258(param6);
         Renamed4880("scpacker.networking.protocol.codec.primitive.ShortCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.tankId = param1 as String;
               break;
            case 1:
               this.team = param1 as Renamed663;
               break;
            case 2:
               this.position = param1 as Renamed603;
               break;
            case 3:
               this.orientation = param1 as Renamed603;
               break;
            case 4:
               this.health = param1 as int;
               break;
            case 5:
               this.incarnationId = param1 as int;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8705();
      }
      
      override public function Renamed4883() : int
      {
         return 39;
      }
      
      override public function getPacketId() : int
      {
         return 875259457;
      }
   }
}

