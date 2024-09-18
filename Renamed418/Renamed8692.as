package Renamed418
{
   import Renamed189.AbstractPacket;
   import Renamed461.Renamed2772;
   
   public class Renamed8692 extends AbstractPacket
   {
      public var tankId:String;
      
      public var moveCommand:Renamed2772;
      
      public var turretDirection:Number;
      
      public function Renamed8692(param1:String = "", param2:Renamed2772 = null, param3:Number = 0)
      {
         super();
         this.tankId = param1;
         this.moveCommand = param2;
         this.turretDirection = param3;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecMoveCommand");
         Renamed1258(param3);
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
               this.moveCommand = param1 as Renamed2772;
               break;
            case 2:
               this.turretDirection = param1 as Number;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8692();
      }
      
      override public function Renamed4883() : int
      {
         return 39;
      }
      
      override public function getPacketId() : int
      {
         return 1516578027;
      }
   }
}

