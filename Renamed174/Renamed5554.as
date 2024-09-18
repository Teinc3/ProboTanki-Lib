package Renamed4312
{
   import Renamed189.AbstractPacket;
   
   public class Renamed4314 extends AbstractPacket
   {
      public var item:String;
      
      public function Renamed4314(param1:String = "")
      {
         super();
         this.item = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.item = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed4314();
      }
      
      override public function Renamed4883() : int
      {
         return 34;
      }
      
      override public function getPacketId() : int
      {
         return -1505530736;
      }
   }
}

