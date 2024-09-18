package Renamed2402
{
   import Renamed189.AbstractPacket;
   import Renamed602.Renamed603;
   
   public class Renamed5373 extends AbstractPacket
   {
      public var bonusId:String;
      
      public var position:Renamed603;
      
      public var Renamed5374:int;
      
      public function Renamed5373(param1:String = "", param2:Renamed603 = null, param3:int = 0)
      {
         super();
         this.bonusId = param1;
         this.position = param2;
         this.Renamed5374 = param3;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecVector3d");
         Renamed1258(param3);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.bonusId = param1 as String;
               break;
            case 1:
               this.position = param1 as Renamed603;
               break;
            case 2:
               this.Renamed5374 = param1 as int;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed5373();
      }
      
      override public function Renamed4883() : int
      {
         return 36;
      }
      
      override public function getPacketId() : int
      {
         return 1831462385;
      }
   }
}

