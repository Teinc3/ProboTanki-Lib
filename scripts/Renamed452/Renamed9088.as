package Renamed452
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed9088 extends AbstractPacket
   {
      public var shooter:String;
      
      public function Renamed9088(param1:String = "")
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
         return new Renamed9088();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 74;
      }
      
      override public function getPacketId() : int
      {
         return -1616602030;
      }
   }
}

