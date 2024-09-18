package Renamed468
{
   import Renamed189.AbstractPacket;
   import Renamed602.Renamed603;
   
   public class Renamed6874 extends AbstractPacket
   {
      public var shooter:String;
      
      public var barrel:int;
      
      public var shotId:int;
      
      public var shotDirection:Renamed603;
      
      public function Renamed6874(param1:String = "", param2:int = 0, param3:int = 0, param4:Renamed603 = null)
      {
         super();
         this.shooter = param1;
         this.barrel = param2;
         this.shotId = param3;
         this.shotDirection = param4;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.ByteCodec");
         Renamed1258(param3);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
         Renamed1258(param4);
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
               this.barrel = param1 as int;
               break;
            case 2:
               this.shotId = param1 as int;
               break;
            case 3:
               this.shotDirection = param1 as Renamed603;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed6874();
      }
      
      override public function Renamed4883() : int
      {
         return 51;
      }
      
      override public function getPacketId() : int
      {
         return -44282936;
      }
   }
}

