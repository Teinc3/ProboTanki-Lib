package Renamed9348
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed6455 extends AbstractPacket
   {
      public var userId:String;
      
      public function Renamed6455(param1:String = "")
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
         return new Renamed6455();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 44;
      }
      
      override public function getPacketId() : int
      {
         return 1411656080;
      }
   }
}

