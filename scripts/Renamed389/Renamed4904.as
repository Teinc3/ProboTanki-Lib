package Renamed389
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed4904 extends AbstractPacket
   {
      public var Renamed6864:int;
      
      public function Renamed4904(param1:int = 0)
      {
         super();
         this.Renamed6864 = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.Renamed6864 = param1 as int;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed4904();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 53;
      }
      
      override public function getPacketId() : int
      {
         return 1147113344;
      }
   }
}

