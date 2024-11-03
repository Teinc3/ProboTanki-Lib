package Renamed7427
{
   import AbstractPackets.AbstractPacket;
   import Renamed341.Renamed7433;
   
   public class Renamed5168 extends AbstractPacket
   {
      public var initParams:Renamed7433;
      
      public function Renamed5168(param1:Renamed7433 = null)
      {
         super();
         this.initParams = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecTipItemCC");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.initParams = param1 as Renamed7433;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed5168();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 73;
      }
      
      override public function getPacketId() : int
      {
         return 2094741924;
      }
   }
}

