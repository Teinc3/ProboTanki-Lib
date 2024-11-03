package Renamed318
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed7698 extends AbstractPacket
   {
      public var mineId:String;
      
      public function Renamed7698(param1:String = "")
      {
         super();
         this.mineId = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.mineId = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed7698();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 62;
      }
      
      override public function getPacketId() : int
      {
         return -718866741;
      }
   }
}

