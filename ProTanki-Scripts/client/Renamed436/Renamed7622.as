package Renamed436
{
   import AbstractPackets.AbstractPacket;
   import projects.tanks.client.battleservice.model.statistics.Renamed4209;
   
   public class Renamed7621 extends AbstractPacket
   {
      public var reward:Vector.<Renamed4209>;
      
      public var timeToRestart:int;
      
      public function Renamed7621(param1:Vector.<Renamed4209> = null, param2:int = 0)
      {
         super();
         this.reward = param1;
         this.timeToRestart = param2;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.VectorCodecUserReward");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.reward = param1 as Vector.<Renamed4209>;
               break;
            case 1:
               this.timeToRestart = param1 as int;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed7621();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 37;
      }
      
      override public function getPacketId() : int
      {
         return 560336625;
      }
   }
}

