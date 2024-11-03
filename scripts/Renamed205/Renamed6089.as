package Renamed205
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed6089 extends AbstractPacket
   {
      public var Renamed2256:String;
      
      public function Renamed6089(param1:String = "")
      {
         super();
         this.Renamed2256 = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.Renamed2256 = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed6089();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 75;
      }
      
      override public function getPacketId() : int
      {
         return 921004371;
      }
   }
}

