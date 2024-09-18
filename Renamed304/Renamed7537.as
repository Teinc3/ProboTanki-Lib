package Renamed304
{
   import Renamed189.AbstractPacket;
   
   public class Renamed7537 extends AbstractPacket
   {
      public var target:String;
      
      public function Renamed7537(param1:String = "")
      {
         super();
         this.target = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.target = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed7537();
      }
      
      override public function Renamed4883() : int
      {
         return 49;
      }
      
      override public function getPacketId() : int
      {
         return -671618989;
      }
   }
}

