package Renamed5154
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed5167 extends AbstractPacket
   {
      public var itemId:String;
      
      public var count:int;
      
      public function Renamed5167(param1:String = "", param2:int = 0)
      {
         super();
         this.itemId = param1;
         this.count = param2;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.itemId = param1 as String;
               break;
            case 1:
               this.count = param1 as int;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed5167();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 43;
      }
      
      override public function getPacketId() : int
      {
         return -502907094;
      }
   }
}

