package Renamed457
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed9119 extends AbstractPacket
   {
      public var reasonForUser:String;
      
      public function Renamed9119(param1:String = "")
      {
         super();
         this.reasonForUser = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.reasonForUser = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed9119();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 7;
      }
      
      override public function getPacketId() : int
      {
         return -600078553;
      }
   }
}

