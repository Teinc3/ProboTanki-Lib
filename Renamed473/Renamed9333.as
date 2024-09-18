package Renamed7249
{
   import Renamed136.Renamed663;
   import Renamed189.AbstractPacket;
   
   public class Renamed9333 extends AbstractPacket
   {
      public var tankId:String;
      
      public var flagTeam:Renamed663;
      
      public function Renamed9333(param1:String = "", param2:Renamed663 = null)
      {
         super();
         this.tankId = param1;
         this.flagTeam = param2;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecBattleTeam");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.tankId = param1 as String;
               break;
            case 1:
               this.flagTeam = param1 as Renamed663;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed9333();
      }
      
      override public function Renamed4883() : int
      {
         return 42;
      }
      
      override public function getPacketId() : int
      {
         return -1282406496;
      }
   }
}

