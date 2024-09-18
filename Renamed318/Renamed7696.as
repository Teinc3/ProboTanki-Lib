package Renamed318
{
   import Renamed189.AbstractPacket;
   
   public class Renamed7696 extends AbstractPacket
   {
      public var mineId:String;
      
      public var targetId:String;
      
      public function Renamed7696(param1:String = "", param2:String = "")
      {
         super();
         this.mineId = param1;
         this.targetId = param2;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.mineId = param1 as String;
               break;
            case 1:
               this.targetId = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed7696();
      }
      
      override public function Renamed4883() : int
      {
         return 62;
      }
      
      override public function getPacketId() : int
      {
         return 1387974401;
      }
   }
}

