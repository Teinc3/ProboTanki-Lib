package Renamed2402
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed4140 extends AbstractPacket
   {
      public var errorType:int;
      
      public function Renamed4140(param1:int = 0)
      {
         super();
         this.errorType = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.ByteCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.errorType = param1 as int;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed4140();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 36;
      }
      
      override public function getPacketId() : int
      {
         return 201628290;
      }
   }
}

