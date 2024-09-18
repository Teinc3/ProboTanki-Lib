package Renamed389
{
   import Renamed189.AbstractPacket;
   import Renamed602.Renamed603;
   
   public class Renamed8411 extends AbstractPacket
   {
      public var Renamed6864:int;
      
      public var target:String;
      
      public var shotId:int;
      
      public var Renamed1530:Renamed603;
      
      public var Renamed8410:Vector.<Renamed603>;
      
      public function Renamed8411(param1:int = 0, param2:String = "", param3:int = 0, param4:Renamed603 = null, param5:Vector.<Renamed603> = null)
      {
         super();
         this.Renamed6864 = param1;
         this.target = param2;
         this.shotId = param3;
         this.Renamed1530 = param4;
         this.Renamed8410 = param5;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param3);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
         Renamed1258(param4);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecVector3d");
         Renamed1258(param5);
         Renamed4880("scpacker.networking.protocol.codec.custom.VectorCodecVector3d");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.Renamed6864 = param1 as int;
               break;
            case 1:
               this.target = param1 as String;
               break;
            case 2:
               this.shotId = param1 as int;
               break;
            case 3:
               this.Renamed1530 = param1 as Renamed603;
               break;
            case 4:
               this.Renamed8410 = param1 as Vector.<Renamed603>;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8411();
      }
      
      override public function Renamed4883() : int
      {
         return 53;
      }
      
      override public function getPacketId() : int
      {
         return 1229701582;
      }
   }
}

