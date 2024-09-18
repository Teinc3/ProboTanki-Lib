package Renamed400
{
   import Renamed189.AbstractPacket;
   import Renamed349.Renamed3105;
   import Renamed82.Renamed8544;
   
   public class Renamed8545 extends AbstractPacket
   {
      public var shooter:String;
      
      public var state:Renamed8544;
      
      public var hit:Renamed3105;
      
      public function Renamed8545(param1:String = "", param2:Renamed8544 = null, param3:Renamed3105 = null)
      {
         super();
         this.shooter = param1;
         this.state = param2;
         this.hit = param3;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecIsisState");
         Renamed1258(param3);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecTargetHit");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.shooter = param1 as String;
               break;
            case 1:
               this.state = param1 as Renamed8544;
               break;
            case 2:
               this.hit = param1 as Renamed3105;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8545();
      }
      
      override public function Renamed4883() : int
      {
         return 55;
      }
      
      override public function getPacketId() : int
      {
         return 2001632000;
      }
   }
}

