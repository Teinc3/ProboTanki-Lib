package Renamed321
{
   import Renamed189.AbstractPacket;
   
   public class Renamed7722 extends AbstractPacket
   {
      public var nickname:String;
      
      public function Renamed7722(param1:String = "")
      {
         super();
         this.nickname = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.nickname = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed7722();
      }
      
      override public function Renamed4883() : int
      {
         return 5;
      }
      
      override public function getPacketId() : int
      {
         return 714838911;
      }
   }
}

