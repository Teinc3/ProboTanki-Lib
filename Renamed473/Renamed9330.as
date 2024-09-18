package Renamed7249
{
   import Renamed136.Renamed663;
   import AbstractPackets.AbstractPacket;
   import Renamed602.3DPositionVector;
   
   public class Renamed9330 extends AbstractPacket
   {
      public var position:3DPositionVector;
      
      public var flagTeam:Renamed663;
      
      public function Renamed9330(param1:3DPositionVector = null, param2:Renamed663 = null)
      {
         super();
         this.position = param1;
         this.flagTeam = param2;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecVector3d");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecBattleTeam");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.position = param1 as 3DPositionVector;
               break;
            case 1:
               this.flagTeam = param1 as Renamed663;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed9330();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 42;
      }
      
      override public function getPacketId() : int
      {
         return 1925237062;
      }
   }
}

