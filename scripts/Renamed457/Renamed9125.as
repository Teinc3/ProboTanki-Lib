package Renamed457
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed9125 extends AbstractPacket
   {
      public var reasonForUser:String;
      
      public var minutes:int;
      
      public var hours:int;
      
      public var days:int;
      
      public function Renamed9125(param1:String = "", param2:int = 0, param3:int = 0, param4:int = 0)
      {
         super();
         this.reasonForUser = param1;
         this.minutes = param2;
         this.hours = param3;
         this.days = param4;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
         addObjToAbsPacket(param3);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
         addObjToAbsPacket(param4);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.reasonForUser = param1 as String;
               break;
            case 1:
               this.minutes = param1 as int;
               break;
            case 2:
               this.hours = param1 as int;
               break;
            case 3:
               this.days = param1 as int;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed9125();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 7;
      }
      
      override public function getPacketId() : int
      {
         return 1200280053;
      }
   }
}

