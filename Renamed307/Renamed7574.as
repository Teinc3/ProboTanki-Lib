package Renamed4971
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed7574 extends AbstractPacket
   {
      public var notificationEnabled:Boolean;
      
      public function Renamed7574(param1:Boolean = false)
      {
         super();
         this.notificationEnabled = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.notificationEnabled = param1 as Boolean;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed7574();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 23;
      }
      
      override public function getPacketId() : int
      {
         return 1447082276;
      }
   }
}

