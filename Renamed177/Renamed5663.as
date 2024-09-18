package Renamed5645
{
   import Renamed189.AbstractPacket;
   
   public class Renamed5663 extends AbstractPacket
   {
      public var login:String;
      
      public var password:String;
      
      public var remember:Boolean;
      
      public function Renamed5663(param1:String = "", param2:String = "", param3:Boolean = false)
      {
         super();
         this.login = param1;
         this.password = param2;
         this.remember = param3;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param3);
         Renamed4880("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.login = param1 as String;
               break;
            case 1:
               this.password = param1 as String;
               break;
            case 2:
               this.remember = param1 as Boolean;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed5663();
      }
      
      override public function Renamed4883() : int
      {
         return 0;
      }
      
      override public function getPacketId() : int
      {
         return -739684591;
      }
   }
}

