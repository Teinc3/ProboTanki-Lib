package Renamed8372
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed9509 extends AbstractPacket
   {
      public var userId:String;
      
      public function Renamed9509(param1:String = "")
      {
         super();
         this.userId = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.userId = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed9509();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 18;
      }
      
      override public function getPacketId() : int
      {
         return 1941694508;
      }
   }
}

