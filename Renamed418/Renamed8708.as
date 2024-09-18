package Renamed418
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed8708 extends AbstractPacket
   {
      public var tankId:String;
      
      public function Renamed8708(param1:String = "")
      {
         super();
         this.tankId = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.tankId = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed8708();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 39;
      }
      
      override public function getPacketId() : int
      {
         return 1868573511;
      }
   }
}

