package Renamed316
{
   import Renamed189.AbstractPacket;
   import Renamed602.Renamed603;
   
   public class Renamed7523 extends AbstractPacket
   {
      public var shooter:String;
      
      public var target:String;
      
      public var relativeHitPoint:Renamed603;
      
      public function Renamed7523(param1:String = "", param2:String = "", param3:Renamed603 = null)
      {
         super();
         this.shooter = param1;
         this.target = param2;
         this.relativeHitPoint = param3;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param3);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecVector3d");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.shooter = param1 as String;
               break;
            case 1:
               this.target = param1 as String;
               break;
            case 2:
               this.relativeHitPoint = param1 as Renamed603;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed7523();
      }
      
      override public function Renamed4883() : int
      {
         return 52;
      }
      
      override public function getPacketId() : int
      {
         return -190359403;
      }
   }
}

