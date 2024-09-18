package Renamed5154
{
   import Renamed189.AbstractPacket;
   
   public class Renamed5169 extends AbstractPacket
   {
      public var mineId:String;
      
      public function Renamed5169(param1:String = "")
      {
         super();
         this.mineId = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.mineId = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed5169();
      }
      
      override public function Renamed4883() : int
      {
         return 43;
      }
      
      override public function getPacketId() : int
      {
         return -1981777467;
      }
   }
}

