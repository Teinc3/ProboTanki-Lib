package Renamed503
{
   import AbstractPackets.AbstractPacket;
   import projects.tanks.client.panel.model.news.showing.NewsShowingCC;
   
   public class Renamed5168 extends AbstractPacket
   {
      public var initParams:NewsShowingCC;
      
      public function Renamed5168(param1:NewsShowingCC = null)
      {
         super();
         this.initParams = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecNewsShowingCC");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.initParams = param1 as NewsShowingCC;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed5168();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 68;
      }
      
      override public function getPacketId() : int
      {
         return -260270890;
      }
   }
}

