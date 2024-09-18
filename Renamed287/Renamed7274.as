package Renamed7273
{
   import Renamed189.AbstractPacket;
   import Renamed602.Renamed603;
   
   public class Renamed7274 extends AbstractPacket
   {
      public var shooterId:String;
      
      public var targetTank:String;
      
      public var localSpotPosition:Renamed603;
      
      public function Renamed7274(param1:String = "", param2:String = "", param3:Renamed603 = null)
      {
         super();
         this.shooterId = param1;
         this.targetTank = param2;
         this.localSpotPosition = param3;
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
               this.shooterId = param1 as String;
               break;
            case 1:
               this.targetTank = param1 as String;
               break;
            case 2:
               this.localSpotPosition = param1 as Renamed603;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed7274();
      }
      
      override public function Renamed4883() : int
      {
         return 50;
      }
      
      override public function getPacketId() : int
      {
         return 11992250;
      }
   }
}

