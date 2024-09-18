package Renamed299
{
   import AbstractPackets.AbstractPacket;
   import Renamed194.TargetTankDamage;
   
   public class Renamed7458 extends AbstractPacket
   {
      public var damages:Vector.<TargetTankDamage>;
      
      public function Renamed7458(param1:Vector.<TargetTankDamage> = null)
      {
         super();
         this.damages = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.VectorCodecTargetTankDamage");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.damages = param1 as Vector.<TargetTankDamage>;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed7458();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 47;
      }
      
      override public function getPacketId() : int
      {
         return -1165230470;
      }
   }
}

