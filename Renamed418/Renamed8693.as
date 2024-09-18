package Renamed418
{
   import Renamed189.AbstractPacket;
   
   public class Renamed8693 extends AbstractPacket
   {
      public var tankId:String;
      
      public var control:int;
      
      public function Renamed8693(param1:String = "", param2:int = 0)
      {
         super();
         this.tankId = param1;
         this.control = param2;
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
               this.tankId = param1 as String;
               break;
            case 1:
               this.control = param1 as int;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8693();
      }
      
      override public function Renamed4883() : int
      {
         return 39;
      }
      
      override public function getPacketId() : int
      {
         return -301298508;
      }
   }
}

