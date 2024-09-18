package Renamed418
{
   import AbstractPackets.AbstractPacket;
   
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
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
         addObjToAbsPacket(param3);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
         addObjToAbsPacket(param4);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         addObjToAbsPacket(param5);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.ByteCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
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
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed8704();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 39;
      }
      
      override public function getPacketId() : int
      {
         return -1639713644;
      }
   }
}

