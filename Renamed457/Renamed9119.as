package Renamed457
{
   import Renamed189.AbstractPacket;
   
   public class Renamed9119 extends AbstractPacket
   {
      public var reasonForUser:String;
      
      public function Renamed9119(param1:String = "")
      {
         super();
         this.reasonForUser = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.reasonForUser = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed9119();
      }
      
      override public function Renamed4883() : int
      {
         return 7;
      }
      
      override public function getPacketId() : int
      {
         return -600078553;
      }
   }
}

