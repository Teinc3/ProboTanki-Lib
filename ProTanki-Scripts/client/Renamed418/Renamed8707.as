package Renamed418
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed8707 extends AbstractPacket
   {
      public var tankId:String;
      
      public var killerTankId:String;
      
      public var respawnDelay:int;
      
      public function Renamed8707(param1:String = "", param2:String = "", param3:int = 0)
      {
         super();
         this.tankId = param1;
         this.killerTankId = param2;
         this.respawnDelay = param3;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param3);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.tankId = param1 as String;
               break;
            case 1:
               this.killerTankId = param1 as String;
               break;
            case 2:
               this.respawnDelay = param1 as int;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed8707();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 39;
      }
      
      override public function getPacketId() : int
      {
         return -42520728;
      }
   }
}

