package Renamed458
{
   import AbstractPackets.AbstractPacket;
   import Renamed602.3DPositionVector;
   import Renamed349.TargetHitInfo;
   
   public class Renamed7524 extends AbstractPacket
   {
      public var shooter:String;
      
      public var direction:3DPositionVector;
      
      public var targets:Vector.<TargetHitInfo>;
      
      public function Renamed7524(param1:String = "", param2:3DPositionVector = null, param3:Vector.<TargetHitInfo> = null)
      {
         super();
         this.shooter = param1;
         this.direction = param2;
         this.targets = param3;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecVector3d");
         addObjToAbsPacket(param3);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.VectorCodecTargetHit");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.shooter = param1 as String;
               break;
            case 1:
               this.direction = param1 as 3DPositionVector;
               break;
            case 2:
               this.targets = param1 as Vector.<TargetHitInfo>;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed7524();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 70;
      }
      
      override public function getPacketId() : int
      {
         return 471157826;
      }
   }
}

