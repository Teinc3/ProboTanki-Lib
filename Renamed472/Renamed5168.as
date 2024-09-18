package Renamed9348
{
   import AbstractPackets.AbstractPacket;
   import Renamed202.Renamed6015;
   
   public class Renamed5168 extends AbstractPacket
   {
      public var initParams:Renamed6015;
      
      public function Renamed5168(param1:Renamed6015 = null)
      {
         super();
         this.initParams = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecStatisticsTeamCC");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.initParams = param1 as Renamed6015;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed5168();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 44;
      }
      
      override public function getPacketId() : int
      {
         return -1233891872;
      }
   }
}

