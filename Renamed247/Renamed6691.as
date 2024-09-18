package Renamed4426
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed6691 extends AbstractPacket
   {
      public var user:String;
      
      public function Renamed6691(param1:String = "")
      {
         super();
         this.user = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.user = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed6691();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 13;
      }
      
      override public function getPacketId() : int
      {
         return 614714702;
      }
   }
}

