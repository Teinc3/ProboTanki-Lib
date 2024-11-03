package Renamed300
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed7476 extends AbstractPacket
   {
      public var currentEmail:String;
      
      public function Renamed7476(param1:String = "")
      {
         super();
         this.currentEmail = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.currentEmail = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed7476();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 9;
      }
      
      override public function getPacketId() : int
      {
         return -2118900410;
      }
   }
}

