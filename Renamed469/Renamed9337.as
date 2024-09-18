package Renamed469
{
   import Renamed189.AbstractPacket;
   import Renamed602.Renamed603;
   
   public class Renamed4845 extends AbstractPacket
   {
      public var time:int;
      
      public var targets:Vector.<String>;
      
      public var Renamed3144:Vector.<int>;
      
      public var Renamed9336:Vector.<Renamed603>;
      
      public var Renamed6867:Vector.<Renamed603>;
      
      public function Renamed4845(param1:int = 0, param2:Vector.<String> = null, param3:Vector.<int> = null, param4:Vector.<Renamed603> = null, param5:Vector.<Renamed603> = null)
      {
         super();
         this.time = param1;
         this.targets = param2;
         this.Renamed3144 = param3;
         this.Renamed9336 = param4;
         this.Renamed6867 = param5;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.complex.VectorCodecString");
         Renamed1258(param3);
         Renamed4880("scpacker.networking.protocol.codec.custom.VectorCodecShort");
         Renamed1258(param4);
         Renamed4880("scpacker.networking.protocol.codec.custom.VectorCodecVector3d");
         Renamed1258(param5);
         Renamed4880("scpacker.networking.protocol.codec.custom.VectorCodecVector3d");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.time = param1 as int;
               break;
            case 1:
               this.targets = param1 as Vector.<String>;
               break;
            case 2:
               this.Renamed3144 = param1 as Vector.<int>;
               break;
            case 3:
               this.Renamed9336 = param1 as Vector.<Renamed603>;
               break;
            case 4:
               this.Renamed6867 = param1 as Vector.<Renamed603>;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed4845();
      }
      
      override public function Renamed4883() : int
      {
         return 56;
      }
      
      override public function getPacketId() : int
      {
         return -2123941185;
      }
   }
}

