package Renamed418
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed8695 extends AbstractPacket
   {
      public var tankId:String;
      
      public var health:Number;
      
      public function Renamed8695(param1:String = "", param2:Number = 0)
      {
         super();
         this.tankId = param1;
         this.health = param2;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.FloatCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.tankId = param1 as String;
               break;
            case 1:
               this.health = param1 as Number;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed8695();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 39;
      }
      
      override public function getPacketId() : int
      {
         return -611961116;
      }
   }
}

