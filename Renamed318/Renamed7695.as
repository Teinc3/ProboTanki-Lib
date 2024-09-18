package Renamed318
{
   import Renamed189.AbstractPacket;
   
   public class Renamed7695 extends AbstractPacket
   {
      public var ownerId:String;
      
      public function Renamed7695(param1:String = "")
      {
         super();
         this.ownerId = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.ownerId = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed7695();
      }
      
      override public function Renamed4883() : int
      {
         return 62;
      }
      
      override public function getPacketId() : int
      {
         return -1200619383;
      }
   }
}

