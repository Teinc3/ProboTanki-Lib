package Renamed389
{
   import Renamed189.AbstractPacket;
   
   public class Renamed4918 extends AbstractPacket
   {
      public var Renamed6864:int;
      
      public var shotId:int;
      
      public var shotDirectionX:int;
      
      public var shotDirectionY:int;
      
      public var shotDirectionZ:int;
      
      public function Renamed4918(param1:int = 0, param2:int = 0, param3:int = 0, param4:int = 0, param5:int = 0)
      {
         super();
         this.Renamed6864 = param1;
         this.shotId = param2;
         this.shotDirectionX = param3;
         this.shotDirectionY = param4;
         this.shotDirectionZ = param5;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
         Renamed1258(param3);
         Renamed4880("scpacker.networking.protocol.codec.primitive.ShortCodec");
         Renamed1258(param4);
         Renamed4880("scpacker.networking.protocol.codec.primitive.ShortCodec");
         Renamed1258(param5);
         Renamed4880("scpacker.networking.protocol.codec.primitive.ShortCodec");
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
               this.shotDirectionX = param1 as int;
               break;
            case 3:
               this.shotDirectionY = param1 as int;
               break;
            case 4:
               this.shotDirectionZ = param1 as int;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed4918();
      }
      
      override public function Renamed4883() : int
      {
         return 53;
      }
      
      override public function getPacketId() : int
      {
         return -1907971330;
      }
   }
}

