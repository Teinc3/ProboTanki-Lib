package Renamed297
{
   import AbstractPackets.AbstractPacket;
   import projects.tanks.client.battlefield.models.bonus.battle.Renamed7400;
   
   public class Renamed7439 extends AbstractPacket
   {
      public var Renamed7440:Vector.<Renamed4159>;
      
      public function Renamed7439(param1:Vector.<Renamed4159> = null)
      {
         super();
         this.Renamed7440 = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.VectorCodecBonusSpawnData");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.Renamed7440 = param1 as Vector.<Renamed4159>;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed7439();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 41;
      }
      
      override public function getPacketId() : int
      {
         return -1205151619;
      }
   }
}

