package Renamed452
{
   import Renamed189.AbstractPacket;
   import Renamed602.Renamed603;
   import Renamed349.Renamed3105;
   
   public class Renamed9080 extends AbstractPacket
   {
      public var shooter:String;
      
      public var direction:Renamed603;
      
      public var targets:Vector.<Renamed3105>;
      
      public function Renamed9080(param1:String = "", param2:Renamed603 = null, param3:Vector.<Renamed3105> = null)
      {
         super();
         this.shooter = param1;
         this.direction = param2;
         this.targets = param3;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecVector3d");
         Renamed1258(param3);
         Renamed4880("scpacker.networking.protocol.codec.custom.VectorCodecTargetHit");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.shooter = param1 as String;
               break;
            case 1:
               this.direction = param1 as Renamed603;
               break;
            case 2:
               this.targets = param1 as Vector.<Renamed3105>;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed9080();
      }
      
      override public function Renamed4883() : int
      {
         return 74;
      }
      
      override public function getPacketId() : int
      {
         return -891286317;
      }
   }
}

