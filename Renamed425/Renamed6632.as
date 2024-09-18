package Renamed425
{
   import Renamed189.AbstractPacket;
   
   public class Renamed6632 extends AbstractPacket
   {
      public var password:String;
      
      public function Renamed6632(param1:String = "")
      {
         super();
         this.password = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.password = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed6632();
      }
      
      override public function Renamed4883() : int
      {
         return 24;
      }
      
      override public function getPacketId() : int
      {
         return 1771456254;
      }
   }
}

