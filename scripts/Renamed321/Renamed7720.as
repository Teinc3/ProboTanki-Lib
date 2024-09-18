package Renamed321
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed7720 extends AbstractPacket
   {
      public var code:String;
      
      public function Renamed7720(param1:String = "")
      {
         super();
         this.code = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.code = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed7720();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 5;
      }
      
      override public function getPacketId() : int
      {
         return 509394385;
      }
   }
}

