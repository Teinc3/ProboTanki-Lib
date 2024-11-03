package Renamed363
{
   import AbstractPackets.AbstractPacket;
   import Renamed420.Renamed8195;
   
   public class Renamed5168 extends AbstractPacket
   {
      public var initParams:Renamed8195;
      
      public function Renamed5168(param1:Renamed8195 = null)
      {
         super();
         this.initParams = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecReferrerPanelCC");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.initParams = param1 as Renamed8195;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed5168();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 76;
      }
      
      override public function getPacketId() : int
      {
         return 832270655;
      }
   }
}

