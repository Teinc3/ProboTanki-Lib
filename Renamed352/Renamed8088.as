package Renamed352
{
   import Renamed189.AbstractPacket;
   
   public class Renamed4310 extends AbstractPacket
   {
      public var uid:String;
      
      public var password:String;
      
      public var rememberMe:Boolean;
      
      public function Renamed4310(param1:String = "", param2:String = "", param3:Boolean = false)
      {
         super();
         this.uid = param1;
         this.password = param2;
         this.rememberMe = param3;
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
               this.uid = param1 as String;
               break;
            case 1:
               this.password = param1 as String;
               break;
            case 2:
               this.rememberMe = param1 as Boolean;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed4310();
      }
      
      override public function Renamed4883() : int
      {
         return 8;
      }
      
      override public function getPacketId() : int
      {
         return 427083290;
      }
   }
}

