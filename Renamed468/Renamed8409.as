package Renamed468
{
   import Renamed189.AbstractPacket;
   import Renamed602.Renamed603;
   
   public class Renamed8409 extends AbstractPacket
   {
      public var Renamed6864:int;
      
      public var shotId:int;
      
      public var Renamed7528:Renamed603;
      
      public function Renamed8409(param1:int = 0, param2:int = 0, param3:Renamed603 = null)
      {
         super();
         this.Renamed6864 = param1;
         this.shotId = param2;
         this.Renamed7528 = param3;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
         Renamed1258(param3);
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
               this.shotId = param1 as int;
               break;
            case 2:
               this.Renamed7528 = param1 as Renamed603;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8409();
      }
      
      override public function Renamed4883() : int
      {
         return 51;
      }
      
      override public function getPacketId() : int
      {
         return -482023661;
      }
   }
}

