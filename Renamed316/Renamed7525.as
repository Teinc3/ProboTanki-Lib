package Renamed316
{
   import Renamed189.AbstractPacket;
   
   public class Renamed7524 extends AbstractPacket
   {
      public var shooter:String;
      
      public function Renamed7524(param1:String = "")
      {
         super();
         this.shooter = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.shooter = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed7524();
      }
      
      override public function Renamed4883() : int
      {
         return 52;
      }
      
      override public function getPacketId() : int
      {
         return 958509220;
      }
   }
}

