package Renamed316
{
   import Renamed189.AbstractPacket;
   import Renamed602.Renamed603;
   
   public class Renamed7668 extends AbstractPacket
   {
      public var Renamed7669:int;
      
      public var hitPoint:Renamed603;
      
      public function Renamed7668(param1:int = 0, param2:Renamed603 = null)
      {
         super();
         this.Renamed7669 = param1;
         this.hitPoint = param2;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecVector3d");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.Renamed7669 = param1 as int;
               break;
            case 1:
               this.hitPoint = param1 as Renamed603;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed7668();
      }
      
      override public function Renamed4883() : int
      {
         return 52;
      }
      
      override public function getPacketId() : int
      {
         return 1501310158;
      }
   }
}

