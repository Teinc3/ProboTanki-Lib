package Renamed328
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed7816 extends AbstractPacket
   {
      public var lifeTimeInSecondsFromCurrentDateTime:int;
      
      public var crystalBonusInPercent:int;
      
      public var scoreBonusInPercent:int;
      
      public function Renamed7816(param1:int = 0, param2:int = 0, param3:int = 0)
      {
         super();
         this.lifeTimeInSecondsFromCurrentDateTime = param1;
         this.crystalBonusInPercent = param2;
         this.scoreBonusInPercent = param3;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
         addObjToAbsPacket(param3);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.lifeTimeInSecondsFromCurrentDateTime = param1 as int;
               break;
            case 1:
               this.crystalBonusInPercent = param1 as int;
               break;
            case 2:
               this.scoreBonusInPercent = param1 as int;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed7816();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 72;
      }
      
      override public function getPacketId() : int
      {
         return 29211250;
      }
   }
}

