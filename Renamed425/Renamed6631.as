package Renamed425
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed6631 extends AbstractPacket
   {
      public var email:String;
      
      public function Renamed6631(param1:String = "")
      {
         super();
         this.email = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.email = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed6631();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 24;
      }
      
      override public function getPacketId() : int
      {
         return -20486732;
      }
   }
}

