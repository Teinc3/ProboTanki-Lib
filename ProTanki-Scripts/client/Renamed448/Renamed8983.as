package Renamed448
{
   import Renamed136.Renamed663;
   import AbstractPackets.AbstractPacket;
   
   public class Renamed8983 extends AbstractPacket
   {
      public var userId:String;
      
      public var message:String;
      
      public var team:Renamed663;
      
      public function Renamed8983(param1:String = "", param2:String = "", param3:Renamed663 = null)
      {
         super();
         this.userId = param1;
         this.message = param2;
         this.team = param3;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param3);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecBattleTeam");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.userId = param1 as String;
               break;
            case 1:
               this.message = param1 as String;
               break;
            case 2:
               this.team = param1 as Renamed663;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed8983();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 61;
      }
      
      override public function getPacketId() : int
      {
         return -449356094;
      }
   }
}

