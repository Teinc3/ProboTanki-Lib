package Renamed4312
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed4314 extends AbstractPacket
   {
      public var item:String;
      
      public function Renamed4314(param1:String = "")
      {
         super();
         this.item = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.item = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed4314();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 34;
      }
      
      override public function getPacketId() : int
      {
         return -1505530736;
      }
   }
}

