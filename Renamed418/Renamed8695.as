package Renamed418
{
   import Renamed189.AbstractPacket;
   
   public class Renamed8695 extends AbstractPacket
   {
      public var tankId:String;
      
      public var health:Number;
      
      public function Renamed8695(param1:String = "", param2:Number = 0)
      {
         super();
         this.tankId = param1;
         this.health = param2;
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
               this.tankId = param1 as String;
               break;
            case 1:
               this.health = param1 as Number;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8695();
      }
      
      override public function Renamed4883() : int
      {
         return 39;
      }
      
      override public function getPacketId() : int
      {
         return -611961116;
      }
   }
}

