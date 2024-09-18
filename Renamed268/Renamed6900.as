package Renamed268
{
   import Renamed189.AbstractPacket;
   
   public class Renamed6900 extends AbstractPacket
   {
      public var name:String;
      
      public function Renamed6900(param1:String = "")
      {
         super();
         this.name = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.name = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed6900();
      }
      
      override public function Renamed4883() : int
      {
         return 30;
      }
      
      override public function getPacketId() : int
      {
         return 120401338;
      }
   }
}

