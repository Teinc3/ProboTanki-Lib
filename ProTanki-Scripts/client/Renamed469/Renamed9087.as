package Renamed469
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed9087 extends AbstractPacket
   {
      public var shooter:String;
      
      public function Renamed9087(param1:String = "")
      {
         super();
         this.shooter = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.shooter = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed9087();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 56;
      }
      
      override public function getPacketId() : int
      {
         return 979099084;
      }
   }
}

