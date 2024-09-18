package Renamed441
{
   import Renamed189.AbstractPacket;
   import projects.tanks.client.commons.models.layout.LayoutState;
   
   public class Renamed8932 extends AbstractPacket
   {
      public var state:LayoutState;
      
      public function Renamed8932(param1:LayoutState = null)
      {
         super();
         this.state = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecLayoutState");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.state = param1 as LayoutState;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8932();
      }
      
      override public function Renamed4883() : int
      {
         return 12;
      }
      
      override public function getPacketId() : int
      {
         return 1118835050;
      }
   }
}

