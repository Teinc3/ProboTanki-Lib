package Renamed492
{
   import AbstractPackets.AbstractPacket;
   import platform.client.fp10.core.resource.Resource;
   
   public class Renamed9643 extends AbstractPacket
   {
      public var donation:int;
      
      public var packageBonusCrystals:int;
      
      public var bonusCrystals:int;
      
      public var image:Resource;
      
      public function Renamed9643(param1:int = 0, param2:int = 0, param3:int = 0, param4:Resource = null)
      {
         super();
         this.donation = param1;
         this.packageBonusCrystals = param2;
         this.bonusCrystals = param3;
         this.image = param4;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
         addObjToAbsPacket(param3);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
         addObjToAbsPacket(param4);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.donation = param1 as int;
               break;
            case 1:
               this.packageBonusCrystals = param1 as int;
               break;
            case 2:
               this.bonusCrystals = param1 as int;
               break;
            case 3:
               this.image = param1 as Resource;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed9643();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 69;
      }
      
      override public function getPacketId() : int
      {
         return 1566424318;
      }
   }
}

