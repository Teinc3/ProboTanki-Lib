package Renamed418
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed5030 extends AbstractPacket
   {
      public var Renamed6864:int;
      
      public var specificationId:int;
      
      public var control:int;
      
      public function Renamed5030(param1:int = 0, param2:int = 0, param3:int = 0)
      {
         super();
         this.Renamed6864 = param1;
         this.specificationId = param2;
         this.control = param3;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.ShortCodec");
         addObjToAbsPacket(param3);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.ByteCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.Renamed6864 = param1 as int;
               break;
            case 1:
               this.specificationId = param1 as int;
               break;
            case 2:
               this.control = param1 as int;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed5030();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 39;
      }
      
      override public function getPacketId() : int
      {
         return -1749108178;
      }
   }
}

