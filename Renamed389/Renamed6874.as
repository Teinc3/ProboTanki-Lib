package Renamed389
{
   import Renamed189.AbstractPacket;
   
   public class Renamed6874 extends AbstractPacket
   {
      public var shooter:String;
      
      public var shotDirectionX:int;
      
      public var shotDirectionY:int;
      
      public var shotDirectionZ:int;
      
      public function Renamed6874(param1:String = "", param2:int = 0, param3:int = 0, param4:int = 0)
      {
         super();
         this.shooter = param1;
         this.shotDirectionX = param2;
         this.shotDirectionY = param3;
         this.shotDirectionZ = param4;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.ShortCodec");
         Renamed1258(param3);
         Renamed4880("scpacker.networking.protocol.codec.primitive.ShortCodec");
         Renamed1258(param4);
         Renamed4880("scpacker.networking.protocol.codec.primitive.ShortCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.shooter = param1 as String;
               break;
            case 1:
               this.shotDirectionX = param1 as int;
               break;
            case 2:
               this.shotDirectionY = param1 as int;
               break;
            case 3:
               this.shotDirectionZ = param1 as int;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed6874();
      }
      
      override public function Renamed4883() : int
      {
         return 53;
      }
      
      override public function getPacketId() : int
      {
         return -118119523;
      }
   }
}

