package Renamed418
{
   import Renamed189.AbstractPacket;
   import Renamed461.Renamed2772;
   
   public class Renamed5034 extends AbstractPacket
   {
      public var Renamed6864:int;
      
      public var specificationId:int;
      
      public var moveCommand:Renamed2772;
      
      public var turretDirection:Number;
      
      public function Renamed5034(param1:int = 0, param2:int = 0, param3:Renamed2772 = null, param4:Number = 0)
      {
         super();
         this.Renamed6864 = param1;
         this.specificationId = param2;
         this.moveCommand = param3;
         this.turretDirection = param4;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.ShortCodec");
         Renamed1258(param3);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecMoveCommand");
         Renamed1258(param4);
         Renamed4880("scpacker.networking.protocol.codec.primitive.FloatCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.Renamed6864 = param1 as int;
               break;
            case 1:
               this.specificationId = param1 as int;
               break;
            case 2:
               this.moveCommand = param1 as Renamed2772;
               break;
            case 3:
               this.turretDirection = param1 as Number;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed5034();
      }
      
      override public function Renamed4883() : int
      {
         return 39;
      }
      
      override public function getPacketId() : int
      {
         return -1683279062;
      }
   }
}

