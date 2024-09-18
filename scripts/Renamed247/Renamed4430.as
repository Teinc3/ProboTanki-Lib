package Renamed4426
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed4430 extends AbstractPacket
   {
      public var userId:String;
      
      public function Renamed4430(param1:String = "")
      {
         super();
         this.userId = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.userId = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed4430();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 13;
      }
      
      override public function getPacketId() : int
      {
         return -1457773660;
      }
   }
}

