package Renamed448
{
   import Renamed189.AbstractPacket;
   
   public class Renamed4253 extends AbstractPacket
   {
      public var message:String;
      
      public var Renamed2583:Boolean;
      
      public function Renamed4253(param1:String = "", param2:Boolean = false)
      {
         super();
         this.message = param1;
         this.Renamed2583 = param2;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.message = param1 as String;
               break;
            case 1:
               this.Renamed2583 = param1 as Boolean;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed4253();
      }
      
      override public function Renamed4883() : int
      {
         return 61;
      }
      
      override public function getPacketId() : int
      {
         return 945463181;
      }
   }
}

