package Renamed7249
{
   import AbstractPackets.AbstractPacket;
   import Renamed4611.Renamed5435;
   
   public class Renamed5168 extends AbstractPacket
   {
      public var initParams:Renamed5435;
      
      public function Renamed5168(param1:Renamed5435 = null)
      {
         super();
         this.initParams = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecCaptureTheFlagCC");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.initParams = param1 as Renamed5435;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed5168();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 42;
      }
      
      override public function getPacketId() : int
      {
         return 789790814;
      }
   }
}

