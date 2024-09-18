package Renamed318
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed7695 extends AbstractPacket
   {
      public var ownerId:String;
      
      public function Renamed7695(param1:String = "")
      {
         super();
         this.ownerId = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.ownerId = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed7695();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 62;
      }
      
      override public function getPacketId() : int
      {
         return -1200619383;
      }
   }
}

