package Renamed7581
{
   import AbstractPackets.AbstractPacket;
   import Renamed416.Renamed7589;
   
   public class Renamed5168 extends AbstractPacket
   {
      public var initParams:Renamed7589;
      
      public function Renamed5168(param1:Renamed7589 = null)
      {
         super();
         this.initParams = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecAchievementCC");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.initParams = param1 as Renamed7589;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed5168();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 67;
      }
      
      override public function getPacketId() : int
      {
         return 602656160;
      }
   }
}

