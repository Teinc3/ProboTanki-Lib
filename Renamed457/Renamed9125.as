package Renamed457
{
   import Renamed189.AbstractPacket;
   
   public class Renamed9125 extends AbstractPacket
   {
      public var reasonForUser:String;
      
      public var minutes:int;
      
      public var hours:int;
      
      public var days:int;
      
      public function Renamed9125(param1:String = "", param2:int = 0, param3:int = 0, param4:int = 0)
      {
         super();
         this.reasonForUser = param1;
         this.minutes = param2;
         this.hours = param3;
         this.days = param4;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
         Renamed1258(param3);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
         Renamed1258(param4);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.reasonForUser = param1 as String;
               break;
            case 1:
               this.minutes = param1 as int;
               break;
            case 2:
               this.hours = param1 as int;
               break;
            case 3:
               this.days = param1 as int;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed9125();
      }
      
      override public function Renamed4883() : int
      {
         return 7;
      }
      
      override public function getPacketId() : int
      {
         return 1200280053;
      }
   }
}

