package Renamed468
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed6861 extends AbstractPacket
   {
      public var shooter:String;
      
      public var barrel:int;
      
      public function Renamed6861(param1:String = "", param2:int = 0)
      {
         super();
         this.shooter = param1;
         this.barrel = param2;
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
               this.shooter = param1 as String;
               break;
            case 1:
               this.barrel = param1 as int;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed6861();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 51;
      }
      
      override public function getPacketId() : int
      {
         return -328554480;
      }
   }
}

