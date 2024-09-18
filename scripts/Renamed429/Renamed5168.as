package Renamed429
{
   import AbstractPackets.AbstractPacket;
   import Renamed206.Renamed6110;
   
   public class Renamed5168 extends AbstractPacket
   {
      public var initParams:Renamed6110;
      
      public function Renamed5168(param1:Renamed6110 = null)
      {
         super();
         this.initParams = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecControlPointsCC");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.initParams = param1 as Renamed6110;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed5168();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 60;
      }
      
      override public function getPacketId() : int
      {
         return -1337059439;
      }
   }
}

