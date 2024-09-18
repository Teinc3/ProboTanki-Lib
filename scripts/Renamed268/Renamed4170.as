package Renamed268
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed4170 extends AbstractPacket
   {
      public var battleName:String;
      
      public function Renamed4170(param1:String = "")
      {
         super();
         this.battleName = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.battleName = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed4170();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 30;
      }
      
      override public function getPacketId() : int
      {
         return 566652736;
      }
   }
}

