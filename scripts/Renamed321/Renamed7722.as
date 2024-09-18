package Renamed321
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed7722 extends AbstractPacket
   {
      public var nickname:String;
      
      public function Renamed7722(param1:String = "")
      {
         super();
         this.nickname = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.nickname = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed7722();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 5;
      }
      
      override public function getPacketId() : int
      {
         return 714838911;
      }
   }
}

