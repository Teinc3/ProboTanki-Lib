package Renamed316
{
   import Renamed189.AbstractPacket;
   import Renamed602.Renamed603;
   
   public class Renamed7673 extends AbstractPacket
   {
      public var Renamed7669:int;
      
      public var relativeHitPoint:Renamed603;
      
      public var target:String;
      
      public var Renamed7527:int;
      
      public var Renamed1530:Renamed603;
      
      public var Renamed7528:Renamed603;
      
      public function Renamed7673(param1:int = 0, param2:Renamed603 = null, param3:String = "", param4:int = 0, param5:Renamed603 = null, param6:Renamed603 = null)
      {
         super();
         this.Renamed7669 = param1;
         this.relativeHitPoint = param2;
         this.target = param3;
         this.Renamed7527 = param4;
         this.Renamed1530 = param5;
         this.Renamed7528 = param6;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecVector3d");
         Renamed1258(param3);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param4);
         Renamed4880("scpacker.networking.protocol.codec.primitive.ShortCodec");
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
               this.Renamed7669 = param1 as int;
               break;
            case 1:
               this.relativeHitPoint = param1 as Renamed603;
               break;
            case 2:
               this.target = param1 as String;
               break;
            case 3:
               this.Renamed7527 = param1 as int;
               break;
            case 4:
               this.Renamed1530 = param1 as Renamed603;
               break;
            case 5:
               this.Renamed7528 = param1 as Renamed603;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed7673();
      }
      
      override public function Renamed4883() : int
      {
         return 52;
      }
      
      override public function getPacketId() : int
      {
         return 259979915;
      }
   }
}

