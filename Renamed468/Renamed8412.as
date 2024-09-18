package Renamed468
{
   import Renamed189.AbstractPacket;
   import Renamed602.Renamed603;
   
   public class Renamed8411 extends AbstractPacket
   {
      public var Renamed6864:int;
      
      public var shotId:int;
      
      public var target:String;
      
      public var Renamed1530:Renamed603;
      
      public var Renamed7528:Renamed603;
      
      public function Renamed8411(param1:int = 0, param2:int = 0, param3:String = "", param4:Renamed603 = null, param5:Renamed603 = null)
      {
         super();
         this.Renamed6864 = param1;
         this.shotId = param2;
         this.target = param3;
         this.Renamed1530 = param4;
         this.Renamed7528 = param5;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
         Renamed1258(param3);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param4);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecVector3d");
         Renamed1258(param5);
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
               this.target = param1 as String;
               break;
            case 3:
               this.Renamed1530 = param1 as Renamed603;
               break;
            case 4:
               this.Renamed7528 = param1 as Renamed603;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8411();
      }
      
      override public function Renamed4883() : int
      {
         return 51;
      }
      
      override public function getPacketId() : int
      {
         return -1723353904;
      }
   }
}

