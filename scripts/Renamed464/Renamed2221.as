package Renamed464
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed2221 extends AbstractPacket
   {
      public var Renamed6841:String;
      
      public function Renamed2221(param1:String = "")
      {
         super();
         this.Renamed6841 = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.Renamed6841 = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed2221();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 16;
      }
      
      override public function getPacketId() : int
      {
         return -511004908;
      }
   }
}

