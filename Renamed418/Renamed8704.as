package Renamed418
{
   import Renamed189.AbstractPacket;
   
   public class Renamed8704 extends AbstractPacket
   {
      public var tankId:String;
      
      public var effectId:int;
      
      public var duration:int;
      
      public var activeAfterDeath:Boolean;
      
      public var effectLevel:int;
      
      public function Renamed8704(param1:String = "", param2:int = 0, param3:int = 0, param4:Boolean = false, param5:int = 0)
      {
         super();
         this.tankId = param1;
         this.effectId = param2;
         this.duration = param3;
         this.activeAfterDeath = param4;
         this.effectLevel = param5;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
         Renamed1258(param3);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
         Renamed1258(param4);
         Renamed4880("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         Renamed1258(param5);
         Renamed4880("scpacker.networking.protocol.codec.primitive.ByteCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.tankId = param1 as String;
               break;
            case 1:
               this.effectId = param1 as int;
               break;
            case 2:
               this.duration = param1 as int;
               break;
            case 3:
               this.activeAfterDeath = param1 as Boolean;
               break;
            case 4:
               this.effectLevel = param1 as int;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8704();
      }
      
      override public function Renamed4883() : int
      {
         return 39;
      }
      
      override public function getPacketId() : int
      {
         return -1639713644;
      }
   }
}

