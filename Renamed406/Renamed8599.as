package Renamed406
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed8598 extends AbstractPacket
   {
      public var lang:String;
      
      public function Renamed8598(param1:String = "")
      {
         super();
         this.lang = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.lang = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed8598();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 4;
      }
      
      override public function getPacketId() : int
      {
         return -1864333717;
      }
   }
}

