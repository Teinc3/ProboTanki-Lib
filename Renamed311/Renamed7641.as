package Renamed311
{
   import Renamed136.Renamed663;
   import AbstractPackets.AbstractPacket;
   import projects.tanks.client.battleselect.model.info.BattleInfoUser;
   
   public class Renamed7641 extends AbstractPacket
   {
      public var battleId:String;
      
      public var user:BattleInfoUser;
      
      public var team:Renamed663;
      
      public function Renamed7641(param1:String = "", param2:BattleInfoUser = null, param3:Renamed663 = null)
      {
         super();
         this.battleId = param1;
         this.user = param2;
         this.team = param3;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecBattleInfoUser");
         addObjToAbsPacket(param3);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecBattleTeam");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.battleId = param1 as String;
               break;
            case 1:
               this.user = param1 as BattleInfoUser;
               break;
            case 2:
               this.team = param1 as Renamed663;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed7641();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 33;
      }
      
      override public function getPacketId() : int
      {
         return 118447426;
      }
   }
}

