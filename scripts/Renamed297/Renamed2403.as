package Renamed297
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed2403 extends AbstractPacket
   {
      public var bonusId:String;
      
      public function Renamed2403(param1:String = "")
      {
         super();
         this.bonusId = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.bonusId = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed2403();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 41;
      }
      
      override public function getPacketId() : int
      {
         return 1044854075;
      }
   }
}

