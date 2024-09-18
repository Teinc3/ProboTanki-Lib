package Renamed321
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed7723 extends AbstractPacket
   {
      public var inviteEnabled:Boolean;
      
      public function Renamed7723(param1:Boolean = false)
      {
         super();
         this.inviteEnabled = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.inviteEnabled = param1 as Boolean;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed7723();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 5;
      }
      
      override public function getPacketId() : int
      {
         return 444933603;
      }
   }
}

