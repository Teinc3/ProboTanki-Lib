package Renamed458
{
   import Renamed189.AbstractPacket;
   import Renamed602.Renamed603;
   import projects.tanks.client.battlefield.models.tankparts.weapons.common.Renamed667;
   
   public class Renamed8059 extends AbstractPacket
   {
      public var Renamed6864:int;
      
      public var direction:Renamed603;
      
      public var targets:Vector.<Renamed667>;
      
      public function Renamed8059(param1:int = 0, param2:Renamed603 = null, param3:Vector.<Renamed667> = null)
      {
         super();
         this.Renamed6864 = param1;
         this.direction = param2;
         this.targets = param3;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecVector3d");
         Renamed1258(param3);
         Renamed4880("scpacker.networking.protocol.codec.custom.VectorCodecTargetPosition");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.Renamed6864 = param1 as int;
               break;
            case 1:
               this.direction = param1 as Renamed603;
               break;
            case 2:
               this.targets = param1 as Vector.<Renamed667>;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8059();
      }
      
      override public function Renamed4883() : int
      {
         return 70;
      }
      
      override public function getPacketId() : int
      {
         return -541655881;
      }
   }
}

