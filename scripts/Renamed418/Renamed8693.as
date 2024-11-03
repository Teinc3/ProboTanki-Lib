package Renamed418
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed8693 extends AbstractPacket
   {
      public var tankId:String;
      
      public var control:int;
      
      public function Renamed8693(param1:String = "", param2:int = 0)
      {
         super();
         this.tankId = param1;
         this.control = param2;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.ByteCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.tankId = param1 as String;
               break;
            case 1:
               this.control = param1 as int;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed8693();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 39;
      }
      
      override public function getPacketId() : int
      {
         return -301298508;
      }
   }
}

