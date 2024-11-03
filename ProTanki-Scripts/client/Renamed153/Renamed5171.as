package Renamed5154
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed5170 extends AbstractPacket
   {
      public var itemId:String;
      
      public function Renamed5170(param1:String = "")
      {
         super();
         this.itemId = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.itemId = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed5170();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 43;
      }
      
      override public function getPacketId() : int
      {
         return -2102525054;
      }
   }
}

