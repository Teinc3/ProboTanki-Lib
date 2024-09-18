package Renamed328
{
   import Renamed189.AbstractPacket;
   
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
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
         Renamed1258(param3);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
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
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed7816();
      }
      
      override public function Renamed4883() : int
      {
         return 72;
      }
      
      override public function getPacketId() : int
      {
         return 29211250;
      }
   }
}

