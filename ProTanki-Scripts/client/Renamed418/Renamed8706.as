package Renamed418
{
   import AbstractPackets.AbstractPacket;
   import Renamed602.3DPositionVector;
   
   public class Renamed8706 extends AbstractPacket
   {
      public var position:3DPositionVector;
      
      public var orientation:3DPositionVector;
      
      public function Renamed8706(param1:3DPositionVector = null, param2:3DPositionVector = null)
      {
         super();
         this.position = param1;
         this.orientation = param2;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecVector3d");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecVector3d");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.position = param1 as 3DPositionVector;
               break;
            case 1:
               this.orientation = param1 as 3DPositionVector;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed8706();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 39;
      }
      
      override public function getPacketId() : int
      {
         return -157204477;
      }
   }
}

