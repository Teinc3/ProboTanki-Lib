package Renamed314
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed7666 extends AbstractPacket
   {
      public var rank:int;
      
      public var score:int;
      
      public var currentRankScore:int;
      
      public var nextRankScore:int;
      
      public var bonusCrystals:int;
      
      public function Renamed7666(param1:int = 0, param2:int = 0, param3:int = 0, param4:int = 0, param5:int = 0)
      {
         super();
         this.rank = param1;
         this.score = param2;
         this.currentRankScore = param3;
         this.nextRankScore = param4;
         this.bonusCrystals = param5;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
         addObjToAbsPacket(param3);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
         addObjToAbsPacket(param4);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
         addObjToAbsPacket(param5);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.rank = param1 as int;
               break;
            case 1:
               this.score = param1 as int;
               break;
            case 2:
               this.currentRankScore = param1 as int;
               break;
            case 3:
               this.nextRankScore = param1 as int;
               break;
            case 4:
               this.bonusCrystals = param1 as int;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed7666();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 29;
      }
      
      override public function getPacketId() : int
      {
         return 1989173907;
      }
   }
}

