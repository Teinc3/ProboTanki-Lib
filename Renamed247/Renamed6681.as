package Renamed4426
{
   import Renamed189.AbstractPacket;
   
   public class Renamed6680 extends AbstractPacket
   {
      public var userId:String;
      
      public function Renamed6680(param1:String = "")
      {
         super();
         this.userId = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.userId = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed6680();
      }
      
      override public function Renamed4883() : int
      {
         return 13;
      }
      
      override public function getPacketId() : int
      {
         return -2089008699;
      }
   }
}

