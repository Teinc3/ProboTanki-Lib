package Renamed406
{
   import Renamed189.AbstractPacket;
   
   public class Renamed8600 extends AbstractPacket
   {
      public var protectionData:Vector.<int>;
      
      public function Renamed8600(param1:Vector.<int> = null)
      {
         super();
         this.protectionData = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.custom.VectorCodecByte");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.protectionData = param1 as Vector.<int>;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8600();
      }
      
      override public function Renamed4883() : int
      {
         return 4;
      }
      
      override public function getPacketId() : int
      {
         return 2001736388;
      }
   }
}

