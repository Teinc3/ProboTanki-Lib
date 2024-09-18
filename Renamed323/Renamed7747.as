package Renamed323
{
   import Renamed189.AbstractPacket;
   
   public class Renamed7747 extends AbstractPacket
   {
      public var senderId:String;
      
      public function Renamed7747(param1:String = "")
      {
         super();
         this.senderId = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.senderId = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed7747();
      }
      
      override public function Renamed4883() : int
      {
         return 15;
      }
      
      override public function getPacketId() : int
      {
         return -1851236532;
      }
   }
}

