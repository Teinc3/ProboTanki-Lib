package Renamed352
{
   import AbstractPackets.AbstractPacket;
   import platform.client.fp10.core.resource.Resource;
   
   public class Renamed8103 extends AbstractPacket
   {
      public var bgResource:Resource;
      
      public var enableRequiredEmail:Boolean;
      
      public var maxPasswordLength:int;
      
      public var minPasswordLength:int;
      
      public function Renamed8103(param1:Resource = null, param2:Boolean = false, param3:int = 0, param4:int = 0)
      {
         super();
         this.bgResource = param1;
         this.enableRequiredEmail = param2;
         this.maxPasswordLength = param3;
         this.minPasswordLength = param4;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         addObjToAbsPacket(param3);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
         addObjToAbsPacket(param4);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.bgResource = param1 as Resource;
               break;
            case 1:
               this.enableRequiredEmail = param1 as Boolean;
               break;
            case 2:
               this.maxPasswordLength = param1 as int;
               break;
            case 3:
               this.minPasswordLength = param1 as int;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed8103();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 8;
      }
      
      override public function getPacketId() : int
      {
         return -1277343167;
      }
   }
}

