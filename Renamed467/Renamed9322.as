package Renamed467
{
   import Renamed189.AbstractPacket;
   
   public class Renamed9322 extends AbstractPacket
   {
      public var flagId:int;
      
      public var baseId:int;
      
      public var delivererTankId:String;
      
      public function Renamed9322(param1:int = 0, param2:int = 0, param3:String = "")
      {
         super();
         this.flagId = param1;
         this.baseId = param2;
         this.delivererTankId = param3;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
         Renamed1258(param3);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.flagId = param1 as int;
               break;
            case 1:
               this.baseId = param1 as int;
               break;
            case 2:
               this.delivererTankId = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed9322();
      }
      
      override public function Renamed4883() : int
      {
         return 71;
      }
      
      override public function getPacketId() : int
      {
         return 1941352088;
      }
   }
}

