package Renamed418
{
   import Renamed189.AbstractPacket;
   import Renamed461.Renamed2772;
   
   public class Renamed8696 extends AbstractPacket
   {
      public var tankId:String;
      
      public var moveCommand:Renamed2772;
      
      public function Renamed8696(param1:String = "", param2:Renamed2772 = null)
      {
         super();
         this.tankId = param1;
         this.moveCommand = param2;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecMoveCommand");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.tankId = param1 as String;
               break;
            case 1:
               this.moveCommand = param1 as Renamed2772;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8696();
      }
      
      override public function Renamed4883() : int
      {
         return 39;
      }
      
      override public function getPacketId() : int
      {
         return -64696933;
      }
   }
}

