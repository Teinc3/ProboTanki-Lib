package Renamed452
{
   import AbstractPackets.AbstractPacket;
   import Renamed602.3DPositionVector;
   import projects.tanks.client.battlefield.models.tankparts.weapons.common.Renamed667;
   
   public class Renamed9076 extends AbstractPacket
   {
      public var Renamed6864:int;
      
      public var direction:3DPositionVector;
      
      public var targets:Vector.<Renamed667>;
      
      public function Renamed9076(param1:int = 0, param2:3DPositionVector = null, param3:Vector.<Renamed667> = null)
      {
         super();
         this.Renamed6864 = param1;
         this.direction = param2;
         this.targets = param3;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecVector3d");
         addObjToAbsPacket(param3);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.VectorCodecTargetPosition");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.Renamed6864 = param1 as int;
               break;
            case 1:
               this.direction = param1 as 3DPositionVector;
               break;
            case 2:
               this.targets = param1 as Vector.<Renamed667>;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed9076();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 74;
      }
      
      override public function getPacketId() : int
      {
         return -1889502569;
      }
   }
}

