package Renamed7273
{
   import Renamed189.AbstractPacket;
   
   public class Renamed7290 extends AbstractPacket
   {
      public var shooterId:String;
      
      public var projectionOnVerticalAxis:Number;
      
      public function Renamed7290(param1:String = "", param2:Number = 0)
      {
         super();
         this.shooterId = param1;
         this.projectionOnVerticalAxis = param2;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.FloatCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.shooterId = param1 as String;
               break;
            case 1:
               this.projectionOnVerticalAxis = param1 as Number;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed7290();
      }
      
      override public function Renamed4883() : int
      {
         return 50;
      }
      
      override public function getPacketId() : int
      {
         return -534192254;
      }
   }
}

