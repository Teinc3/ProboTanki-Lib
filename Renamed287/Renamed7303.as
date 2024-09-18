package Renamed7273
{
   import Renamed189.AbstractPacket;
   
   public class Renamed7303 extends AbstractPacket
   {
      public var shooterId:String;
      
      public function Renamed7303(param1:String = "")
      {
         super();
         this.shooterId = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.shooterId = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed7303();
      }
      
      override public function Renamed4883() : int
      {
         return 50;
      }
      
      override public function getPacketId() : int
      {
         return -380595194;
      }
   }
}

