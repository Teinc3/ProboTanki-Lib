package Renamed7273
{
   import Renamed189.AbstractPacket;
   import Renamed602.Renamed603;
   
   public class Renamed7294 extends AbstractPacket
   {
      public var time:int;
      
      public var staticHitPoint:Renamed603;
      
      public var targets:Vector.<String>;
      
      public var targetHitPoints:Vector.<Renamed603>;
      
      public var Renamed6865:Vector.<int>;
      
      public var Renamed6866:Vector.<Renamed603>;
      
      public var Renamed6867:Vector.<Renamed603>;
      
      public function Renamed7294(param1:int = 0, param2:Renamed603 = null, param3:Vector.<String> = null, param4:Vector.<Renamed603> = null, param5:Vector.<int> = null, param6:Vector.<Renamed603> = null, param7:Vector.<Renamed603> = null)
      {
         super();
         this.time = param1;
         this.staticHitPoint = param2;
         this.targets = param3;
         this.targetHitPoints = param4;
         this.Renamed6865 = param5;
         this.Renamed6866 = param6;
         this.Renamed6867 = param7;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecVector3d");
         Renamed1258(param3);
         Renamed4880("scpacker.networking.protocol.codec.complex.VectorCodecString");
         Renamed1258(param4);
         Renamed4880("scpacker.networking.protocol.codec.custom.VectorCodecVector3d");
         Renamed1258(param5);
         Renamed4880("scpacker.networking.protocol.codec.custom.VectorCodecShort");
         Renamed1258(param6);
         Renamed4880("scpacker.networking.protocol.codec.custom.VectorCodecVector3d");
         Renamed1258(param7);
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
               this.staticHitPoint = param1 as Renamed603;
               break;
            case 2:
               this.targets = param1 as Vector.<String>;
               break;
            case 3:
               this.targetHitPoints = param1 as Vector.<Renamed603>;
               break;
            case 4:
               this.Renamed6865 = param1 as Vector.<int>;
               break;
            case 5:
               this.Renamed6866 = param1 as Vector.<Renamed603>;
               break;
            case 6:
               this.Renamed6867 = param1 as Vector.<Renamed603>;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed7294();
      }
      
      override public function Renamed4883() : int
      {
         return 50;
      }
      
      override public function getPacketId() : int
      {
         return 1632423559;
      }
   }
}

