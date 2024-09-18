package Renamed4312
{
   import Renamed189.AbstractPacket;
   
   public class Renamed5066 extends AbstractPacket
   {
      public var Renamed5615:String;
      
      public var Renamed5557:String;
      
      public var text:String;
      
      public var Renamed5552:int;
      
      public function Renamed5066(param1:String = "", param2:String = "", param3:String = "", param4:int = 0)
      {
         super();
         this.Renamed5615 = param1;
         this.Renamed5557 = param2;
         this.text = param3;
         this.Renamed5552 = param4;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param3);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param4);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.Renamed5615 = param1 as String;
               break;
            case 1:
               this.Renamed5557 = param1 as String;
               break;
            case 2:
               this.text = param1 as String;
               break;
            case 3:
               this.Renamed5552 = param1 as int;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed5066();
      }
      
      override public function Renamed4883() : int
      {
         return 34;
      }
      
      override public function getPacketId() : int
      {
         return -1518850075;
      }
   }
}

