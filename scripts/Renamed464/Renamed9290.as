package Renamed464
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed2220 extends AbstractPacket
   {
      public var itemId:String;
      
      public var Renamed9289:String;
      
      public function Renamed2220(param1:String = "", param2:String = "")
      {
         super();
         this.itemId = param1;
         this.Renamed9289 = param2;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.itemId = param1 as String;
               break;
            case 1:
               this.Renamed9289 = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed2220();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 16;
      }
      
      override public function getPacketId() : int
      {
         return 880756819;
      }
   }
}

