package Renamed214
{
   import Renamed189.AbstractPacket;
   
   public class Renamed6238 extends AbstractPacket
   {
      public var uid:String;
      
      public function Renamed6238(param1:String = "")
      {
         super();
         this.uid = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.uid = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed6238();
      }
      
      override public function Renamed4883() : int
      {
         return 65;
      }
      
      override public function getPacketId() : int
      {
         return 463494974;
      }
   }
}

