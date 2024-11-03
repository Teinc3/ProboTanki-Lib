package Renamed4312
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed5555 extends AbstractPacket
   {
      public var itemId:String;
      
      public var mounted:Boolean;
      
      public function Renamed5555(param1:String = "", param2:Boolean = false)
      {
         super();
         this.itemId = param1;
         this.mounted = param2;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.itemId = param1 as String;
               break;
            case 1:
               this.mounted = param1 as Boolean;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed5555();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 34;
      }
      
      override public function getPacketId() : int
      {
         return 2062201643;
      }
   }
}

