package Renamed400
{
   import Renamed189.AbstractPacket;
   import Renamed602.Renamed603;
   
   public class Renamed8533 extends AbstractPacket
   {
      public var time:int;
      
      public var target:String;
      
      public var Renamed7527:int;
      
      public var Renamed3116:Renamed603;
      
      public function Renamed8533(param1:int = 0, param2:String = "", param3:int = 0, param4:Renamed603 = null)
      {
         super();
         this.time = param1;
         this.target = param2;
         this.Renamed7527 = param3;
         this.Renamed3116 = param4;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param3);
         Renamed4880("scpacker.networking.protocol.codec.primitive.ShortCodec");
         Renamed1258(param4);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecVector3d");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.time = param1 as int;
               break;
            case 1:
               this.target = param1 as String;
               break;
            case 2:
               this.Renamed7527 = param1 as int;
               break;
            case 3:
               this.Renamed3116 = param1 as Renamed603;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8533();
      }
      
      override public function Renamed4883() : int
      {
         return 55;
      }
      
      override public function getPacketId() : int
      {
         return 381067984;
      }
   }
}

