package Renamed363
{
   import Renamed189.AbstractPacket;
   import Renamed420.Renamed8195;
   
   public class Renamed5168 extends AbstractPacket
   {
      public var initParams:Renamed8195;
      
      public function Renamed5168(param1:Renamed8195 = null)
      {
         super();
         this.initParams = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecReferrerPanelCC");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.initParams = param1 as Renamed8195;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed5168();
      }
      
      override public function Renamed4883() : int
      {
         return 76;
      }
      
      override public function getPacketId() : int
      {
         return 832270655;
      }
   }
}

