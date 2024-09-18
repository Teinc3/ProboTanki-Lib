package Renamed429
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed8854 extends AbstractPacket
   {
      public var pointId:int;
      
      public var progress:Number;
      
      public var progressSpeed:Number;
      
      public function Renamed8854(param1:int = 0, param2:Number = 0, param3:Number = 0)
      {
         super();
         this.pointId = param1;
         this.progress = param2;
         this.progressSpeed = param3;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.FloatCodec");
         addObjToAbsPacket(param3);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.FloatCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.pointId = param1 as int;
               break;
            case 1:
               this.progress = param1 as Number;
               break;
            case 2:
               this.progressSpeed = param1 as Number;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed8854();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 60;
      }
      
      override public function getPacketId() : int
      {
         return -2141998253;
      }
   }
}

