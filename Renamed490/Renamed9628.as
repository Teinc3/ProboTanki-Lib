package Renamed490
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed9628 extends AbstractPacket
   {
      public var socialNetworkId:String;
      
      public function Renamed9628(param1:String = "")
      {
         super();
         this.socialNetworkId = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.socialNetworkId = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed9628();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 22;
      }
      
      override public function getPacketId() : int
      {
         return 2098576423;
      }
   }
}

