package Renamed228
{
   import AbstractPackets.AbstractPacket;
   import Renamed383.Renamed6454;
   
   public class Renamed5168 extends AbstractPacket
   {
      public var initParams:Renamed6454;
      
      public function Renamed5168(param1:Renamed6454 = null)
      {
         super();
         this.initParams = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecStatisticsDMCC");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.initParams = param1 as Renamed6454;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed5168();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 48;
      }
      
      override public function getPacketId() : int
      {
         return -1959138292;
      }
   }
}

