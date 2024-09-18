package Renamed458
{
   import Renamed189.AbstractPacket;
   import Renamed602.Renamed603;
   
   public class Renamed8060 extends AbstractPacket
   {
      public var Renamed6864:int;
      
      public var direction:Renamed603;
      
      public function Renamed8060(param1:int = 0, param2:Renamed603 = null)
      {
         super();
         this.Renamed6864 = param1;
         this.direction = param2;
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
               this.Renamed6864 = param1 as int;
               break;
            case 1:
               this.direction = param1 as Renamed603;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8060();
      }
      
      override public function Renamed4883() : int
      {
         return 70;
      }
      
      override public function getPacketId() : int
      {
         return 2128281231;
      }
   }
}

