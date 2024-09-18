package Renamed345
{
   import Renamed189.AbstractPacket;
   
   public class Renamed5800 extends AbstractPacket
   {
      public var Renamed6864:int;
      
      public var serverSessionTime:int;
      
      public function Renamed5800(param1:int = 0, param2:int = 0)
      {
         super();
         this.Renamed6864 = param1;
         this.serverSessionTime = param2;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.Renamed6864 = param1 as int;
               break;
            case 1:
               this.serverSessionTime = param1 as int;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed5800();
      }
      
      override public function Renamed4883() : int
      {
         return 46;
      }
      
      override public function getPacketId() : int
      {
         return 2074243318;
      }
   }
}

