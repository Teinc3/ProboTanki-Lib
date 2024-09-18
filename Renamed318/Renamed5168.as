package Renamed318
{
   import AbstractPackets.AbstractPacket;
   import Renamed326.Renamed7688;
   
   public class Renamed5168 extends AbstractPacket
   {
      public var initParams:Renamed7688;
      
      public function Renamed5168(param1:Renamed7688 = null)
      {
         super();
         this.initParams = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecBattleMineCC");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.initParams = param1 as Renamed7688;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed5168();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 62;
      }
      
      override public function getPacketId() : int
      {
         return -226978906;
      }
   }
}

