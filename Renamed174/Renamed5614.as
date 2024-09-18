package Renamed4312
{
   import Renamed189.AbstractPacket;
   
   public class Renamed5614 extends AbstractPacket
   {
      public var category:String;
      
      public function Renamed5614(param1:String = "")
      {
         super();
         this.category = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.category = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed5614();
      }
      
      override public function Renamed4883() : int
      {
         return 34;
      }
      
      override public function getPacketId() : int
      {
         return 1318061480;
      }
   }
}

