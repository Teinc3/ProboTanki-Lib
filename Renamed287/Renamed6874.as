package Renamed7273
{
   import Renamed189.AbstractPacket;
   import Renamed602.Renamed603;
   
   public class Renamed6874 extends AbstractPacket
   {
      public var shooter:String;
      
      public var staticHitPoint:Renamed603;
      
      public var targets:Vector.<String>;
      
      public var targetHitPoints:Vector.<Renamed603>;
      
      public var impactForce:Number;
      
      public function Renamed6874(param1:String = "", param2:Renamed603 = null, param3:Vector.<String> = null, param4:Vector.<Renamed603> = null, param5:Number = 0)
      {
         super();
         this.shooter = param1;
         this.staticHitPoint = param2;
         this.targets = param3;
         this.targetHitPoints = param4;
         this.impactForce = param5;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecVector3d");
         Renamed1258(param3);
         Renamed4880("scpacker.networking.protocol.codec.complex.VectorCodecString");
         Renamed1258(param4);
         Renamed4880("scpacker.networking.protocol.codec.custom.VectorCodecVector3d");
         Renamed1258(param5);
         Renamed4880("scpacker.networking.protocol.codec.primitive.FloatCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.shooter = param1 as String;
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
               this.impactForce = param1 as Number;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed6874();
      }
      
      override public function Renamed4883() : int
      {
         return 50;
      }
      
      override public function getPacketId() : int
      {
         return 1184835319;
      }
   }
}

