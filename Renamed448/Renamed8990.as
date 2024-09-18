package Renamed448
{
   import Renamed189.AbstractPacket;
   
   public class Renamed8990 extends AbstractPacket
   {
      public var message:String;
      
      public function Renamed8990(param1:String = "")
      {
         super();
         this.message = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.message = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8990();
      }
      
      override public function Renamed4883() : int
      {
         return 61;
      }
      
      override public function getPacketId() : int
      {
         return 606668848;
      }
   }
}

