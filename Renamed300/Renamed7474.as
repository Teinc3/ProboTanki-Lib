package Renamed300
{
   import Renamed189.AbstractPacket;
   
   public class Renamed6196 extends AbstractPacket
   {
      public var email:String;
      
      public function Renamed6196(param1:String = "")
      {
         super();
         this.email = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.email = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed6196();
      }
      
      override public function Renamed4883() : int
      {
         return 9;
      }
      
      override public function getPacketId() : int
      {
         return 1744584433;
      }
   }
}

