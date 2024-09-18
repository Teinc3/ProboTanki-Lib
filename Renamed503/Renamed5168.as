package Renamed503
{
   import Renamed189.AbstractPacket;
   import projects.tanks.client.panel.model.news.showing.NewsShowingCC;
   
   public class Renamed5168 extends AbstractPacket
   {
      public var initParams:NewsShowingCC;
      
      public function Renamed5168(param1:NewsShowingCC = null)
      {
         super();
         this.initParams = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecNewsShowingCC");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.initParams = param1 as NewsShowingCC;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed5168();
      }
      
      override public function Renamed4883() : int
      {
         return 68;
      }
      
      override public function getPacketId() : int
      {
         return -260270890;
      }
   }
}

