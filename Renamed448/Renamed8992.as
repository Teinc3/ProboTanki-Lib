package Renamed448
{
   import Renamed189.AbstractPacket;
   
   public class Renamed8992 extends AbstractPacket
   {
      public var uid:String;
      
      public var message:String;
      
      public function Renamed8992(param1:String = "", param2:String = "")
      {
         super();
         this.uid = param1;
         this.message = param2;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.uid = param1 as String;
               break;
            case 1:
               this.message = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8992();
      }
      
      override public function Renamed4883() : int
      {
         return 61;
      }
      
      override public function getPacketId() : int
      {
         return 1532749363;
      }
   }
}

