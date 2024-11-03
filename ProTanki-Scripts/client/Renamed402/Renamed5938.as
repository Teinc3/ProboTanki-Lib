package Renamed402
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed5938 extends AbstractPacket
   {
      public var text:String;
      
      public function Renamed5938(param1:String = "")
      {
         super();
         this.text = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.text = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed5938();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 25;
      }
      
      override public function getPacketId() : int
      {
         return -322235316;
      }
   }
}

