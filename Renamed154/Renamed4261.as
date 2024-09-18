package Renamed4257
{
   import Renamed189.AbstractPacket;
   import projects.tanks.client.commons.models.layout.LayoutState;
   
   public class Renamed4261 extends AbstractPacket
   {
      public var Renamed5173:LayoutState;
      
      public function Renamed4261(param1:LayoutState = null)
      {
         super();
         this.Renamed5173 = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecLayoutState");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.Renamed5173 = param1 as LayoutState;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed4261();
      }
      
      override public function Renamed4883() : int
      {
         return 17;
      }
      
      override public function getPacketId() : int
      {
         return 377959142;
      }
   }
}

