package Renamed228
{
   import Renamed189.AbstractPacket;
   import Renamed383.Renamed6454;
   
   public class Renamed5168 extends AbstractPacket
   {
      public var initParams:Renamed6454;
      
      public function Renamed5168(param1:Renamed6454 = null)
      {
         super();
         this.initParams = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecStatisticsDMCC");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.initParams = param1 as Renamed6454;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed5168();
      }
      
      override public function Renamed4883() : int
      {
         return 48;
      }
      
      override public function getPacketId() : int
      {
         return -1959138292;
      }
   }
}

