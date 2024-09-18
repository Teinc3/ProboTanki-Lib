package Renamed7249
{
   import Renamed189.AbstractPacket;
   import Renamed4611.Renamed5435;
   
   public class Renamed5168 extends AbstractPacket
   {
      public var initParams:Renamed5435;
      
      public function Renamed5168(param1:Renamed5435 = null)
      {
         super();
         this.initParams = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecCaptureTheFlagCC");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.initParams = param1 as Renamed5435;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed5168();
      }
      
      override public function Renamed4883() : int
      {
         return 42;
      }
      
      override public function getPacketId() : int
      {
         return 789790814;
      }
   }
}

