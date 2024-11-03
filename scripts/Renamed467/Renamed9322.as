package Renamed467
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed9322 extends AbstractPacket
   {
      public var flagId:int;
      
      public var baseId:int;
      
      public var delivererTankId:String;
      
      public function Renamed9322(param1:int = 0, param2:int = 0, param3:String = "")
      {
         super();
         this.flagId = param1;
         this.baseId = param2;
         this.delivererTankId = param3;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
         addObjToAbsPacket(param3);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.flagId = param1 as int;
               break;
            case 1:
               this.baseId = param1 as int;
               break;
            case 2:
               this.delivererTankId = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed9322();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 71;
      }
      
      override public function getPacketId() : int
      {
         return 1941352088;
      }
   }
}

