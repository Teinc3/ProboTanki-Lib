package Renamed377
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed7448 extends AbstractPacket
   {
      public var link:String;
      
      public function Renamed7448(param1:String = "")
      {
         super();
         this.link = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.link = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed7448();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 14;
      }
      
      override public function getPacketId() : int
      {
         return -604091695;
      }
   }
}

