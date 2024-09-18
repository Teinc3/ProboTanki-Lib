package Renamed418
{
   import Renamed189.AbstractPacket;
   
   public class Renamed8707 extends AbstractPacket
   {
      public var tankId:String;
      
      public var killerTankId:String;
      
      public var respawnDelay:int;
      
      public function Renamed8707(param1:String = "", param2:String = "", param3:int = 0)
      {
         super();
         this.tankId = param1;
         this.killerTankId = param2;
         this.respawnDelay = param3;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param3);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
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
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8707();
      }
      
      override public function Renamed4883() : int
      {
         return 39;
      }
      
      override public function getPacketId() : int
      {
         return -42520728;
      }
   }
}

