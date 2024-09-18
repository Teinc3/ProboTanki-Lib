package Renamed299
{
   import Renamed189.AbstractPacket;
   import Renamed194.Renamed5920;
   
   public class Renamed7458 extends AbstractPacket
   {
      public var damages:Vector.<Renamed5920>;
      
      public function Renamed7458(param1:Vector.<Renamed5920> = null)
      {
         super();
         this.damages = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.custom.VectorCodecTargetTankDamage");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.damages = param1 as Vector.<Renamed5920>;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed7458();
      }
      
      override public function Renamed4883() : int
      {
         return 47;
      }
      
      override public function getPacketId() : int
      {
         return -1165230470;
      }
   }
}

