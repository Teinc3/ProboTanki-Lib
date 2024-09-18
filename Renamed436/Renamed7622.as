package Renamed436
{
   import Renamed189.AbstractPacket;
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
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.custom.VectorCodecUserReward");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
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
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed7621();
      }
      
      override public function Renamed4883() : int
      {
         return 37;
      }
      
      override public function getPacketId() : int
      {
         return 560336625;
      }
   }
}

