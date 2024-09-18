package Renamed467
{
   import Renamed189.AbstractPacket;
   import Renamed602.Renamed603;
   
   public class Renamed9330 extends AbstractPacket
   {
      public var flagId:int;
      
      public var position:Renamed603;
      
      public function Renamed9330(param1:int = 0, param2:Renamed603 = null)
      {
         super();
         this.flagId = param1;
         this.position = param2;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecVector3d");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.flagId = param1 as int;
               break;
            case 1:
               this.position = param1 as Renamed603;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed9330();
      }
      
      override public function Renamed4883() : int
      {
         return 71;
      }
      
      override public function getPacketId() : int
      {
         return 1817559787;
      }
   }
}

