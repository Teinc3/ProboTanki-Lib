package Renamed314
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed7664 extends AbstractPacket
   {
      public var rating:Number;
      
      public var place:int;
      
      public function Renamed7664(param1:Number = 0, param2:int = 0)
      {
         super();
         this.rating = param1;
         this.place = param2;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.FloatCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.rating = param1 as Number;
               break;
            case 1:
               this.place = param1 as int;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed7664();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 29;
      }
      
      override public function getPacketId() : int
      {
         return -1128606444;
      }
   }
}

