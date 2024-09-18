package Renamed284
{
   import Renamed189.AbstractPacket;
   
   public class Renamed4353 extends AbstractPacket
   {
      public var questId:int;
      
      public function Renamed4353(param1:int = 0)
      {
         super();
         this.questId = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.questId = param1 as int;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed4353();
      }
      
      override public function Renamed4883() : int
      {
         return 19;
      }
      
      override public function getPacketId() : int
      {
         return -867767128;
      }
   }
}

