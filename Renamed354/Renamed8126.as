package Renamed354
{
   import Renamed189.AbstractPacket;
   
   public class Renamed8126 extends AbstractPacket
   {
      public var hash:String;
      
      public function Renamed8126(param1:String = "")
      {
         super();
         this.hash = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.hash = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8126();
      }
      
      override public function Renamed4883() : int
      {
         return 1;
      }
      
      override public function getPacketId() : int
      {
         return -845588810;
      }
   }
}

