package Renamed418
{
   import Renamed189.AbstractPacket;
   
   public class Renamed5030 extends AbstractPacket
   {
      public var Renamed6864:int;
      
      public var specificationId:int;
      
      public var control:int;
      
      public function Renamed5030(param1:int = 0, param2:int = 0, param3:int = 0)
      {
         super();
         this.Renamed6864 = param1;
         this.specificationId = param2;
         this.control = param3;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.ShortCodec");
         Renamed1258(param3);
         Renamed4880("scpacker.networking.protocol.codec.primitive.ByteCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.Renamed6864 = param1 as int;
               break;
            case 1:
               this.specificationId = param1 as int;
               break;
            case 2:
               this.control = param1 as int;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed5030();
      }
      
      override public function Renamed4883() : int
      {
         return 39;
      }
      
      override public function getPacketId() : int
      {
         return -1749108178;
      }
   }
}

