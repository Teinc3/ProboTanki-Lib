package Renamed441
{
   import Renamed189.AbstractPacket;
   import projects.tanks.client.commons.models.layout.LayoutState;
   
   public class Renamed8931 extends AbstractPacket
   {
      public var origin:LayoutState;
      
      public var state:LayoutState;
      
      public function Renamed8931(param1:LayoutState = null, param2:LayoutState = null)
      {
         super();
         this.origin = param1;
         this.state = param2;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecLayoutState");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecLayoutState");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.origin = param1 as LayoutState;
               break;
            case 1:
               this.state = param1 as LayoutState;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8931();
      }
      
      override public function Renamed4883() : int
      {
         return 12;
      }
      
      override public function getPacketId() : int
      {
         return -593368100;
      }
   }
}

