package Renamed214
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed6238 extends AbstractPacket
   {
      public var uid:String;
      
      public function Renamed6238(param1:String = "")
      {
         super();
         this.uid = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.uid = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed6238();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 65;
      }
      
      override public function getPacketId() : int
      {
         return 463494974;
      }
   }
}

