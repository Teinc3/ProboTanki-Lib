package Renamed468
{
   import Renamed189.AbstractPacket;
   
   public class Renamed6861 extends AbstractPacket
   {
      public var shooter:String;
      
      public var barrel:int;
      
      public function Renamed6861(param1:String = "", param2:int = 0)
      {
         super();
         this.shooter = param1;
         this.barrel = param2;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.ByteCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.shooter = param1 as String;
               break;
            case 1:
               this.barrel = param1 as int;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed6861();
      }
      
      override public function Renamed4883() : int
      {
         return 51;
      }
      
      override public function getPacketId() : int
      {
         return -328554480;
      }
   }
}

