package Renamed418
{
   import Renamed136.Renamed663;
   import AbstractPackets.AbstractPacket;
   import Renamed602.3DPositionVector;
   
   public class Renamed8705 extends AbstractPacket
   {
      public var tankId:String;
      
      public var team:Renamed663;
      
      public var position:3DPositionVector;
      
      public var orientation:3DPositionVector;
      
      public var health:int;
      
      public var incarnationId:int;
      
      public function Renamed8705(param1:String = "", param2:Renamed663 = null, param3:3DPositionVector = null, param4:3DPositionVector = null, param5:int = 0, param6:int = 0)
      {
         super();
         this.tankId = param1;
         this.team = param2;
         this.position = param3;
         this.orientation = param4;
         this.health = param5;
         this.incarnationId = param6;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecBattleTeam");
         addObjToAbsPacket(param3);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecVector3d");
         addObjToAbsPacket(param4);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecVector3d");
         addObjToAbsPacket(param5);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.ShortCodec");
         addObjToAbsPacket(param6);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.ShortCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.tankId = param1 as String;
               break;
            case 1:
               this.team = param1 as Renamed663;
               break;
            case 2:
               this.position = param1 as 3DPositionVector;
               break;
            case 3:
               this.orientation = param1 as 3DPositionVector;
               break;
            case 4:
               this.health = param1 as int;
               break;
            case 5:
               this.incarnationId = param1 as int;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed8705();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 39;
      }
      
      override public function getPacketId() : int
      {
         return 875259457;
      }
   }
}

