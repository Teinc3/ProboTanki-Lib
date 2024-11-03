package Renamed311
{
   import Renamed136.Renamed663;
   import AbstractPackets.AbstractPacket;
   
   public class Renamed7647 extends AbstractPacket
   {
      public var battleId:String;
      
      public var teamType:Renamed663;
      
      public var score:int;
      
      public function Renamed7647(param1:String = "", param2:Renamed663 = null, param3:int = 0)
      {
         super();
         this.battleId = param1;
         this.teamType = param2;
         this.score = param3;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecBattleTeam");
         addObjToAbsPacket(param3);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.battleId = param1 as String;
               break;
            case 1:
               this.teamType = param1 as Renamed663;
               break;
            case 2:
               this.score = param1 as int;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed7647();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 33;
      }
      
      override public function getPacketId() : int
      {
         return 1428217189;
      }
   }
}

