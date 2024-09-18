package Renamed304
{
   import Renamed189.AbstractPacket;
   import Renamed602.Renamed603;
   
   public class Renamed6178 extends AbstractPacket
   {
      public var Renamed6864:int;
      
      public var target:String;
      
      public var Renamed7527:int;
      
      public var Renamed1530:Renamed603;
      
      public var hitPoint:Renamed603;
      
      public var Renamed7528:Renamed603;
      
      public function Renamed6178(param1:int = 0, param2:String = "", param3:int = 0, param4:Renamed603 = null, param5:Renamed603 = null, param6:Renamed603 = null)
      {
         super();
         this.Renamed6864 = param1;
         this.target = param2;
         this.Renamed7527 = param3;
         this.Renamed1530 = param4;
         this.hitPoint = param5;
         this.Renamed7528 = param6;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param3);
         Renamed4880("scpacker.networking.protocol.codec.primitive.ShortCodec");
         Renamed1258(param4);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecVector3d");
         Renamed1258(param5);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecVector3d");
         Renamed1258(param6);
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
               this.target = param1 as String;
               break;
            case 2:
               this.Renamed7527 = param1 as int;
               break;
            case 3:
               this.Renamed1530 = param1 as Renamed603;
               break;
            case 4:
               this.hitPoint = param1 as Renamed603;
               break;
            case 5:
               this.Renamed7528 = param1 as Renamed603;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed6178();
      }
      
      override public function Renamed4883() : int
      {
         return 49;
      }
      
      override public function getPacketId() : int
      {
         return 229267683;
      }
   }
}

