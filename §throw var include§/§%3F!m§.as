package §throw var include§
{
   import §&#;§.AbstractPacket;
   import projects.tanks.client.battleservice.model.statistics.§2$ §;
   
   public class §?!m§ extends AbstractPacket
   {
      public var reward:Vector.<§2$ §>;
      
      public var timeToRestart:int;
      
      public function §?!m§(param1:Vector.<§2$ §> = null, param2:int = 0)
      {
         super();
         this.reward = param1;
         this.timeToRestart = param2;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.custom.VectorCodecUserReward");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.reward = param1 as Vector.<§2$ §>;
               break;
            case 1:
               this.timeToRestart = param1 as int;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §?!m§();
      }
      
      override public function §package package final§() : int
      {
         return 37;
      }
      
      override public function getPacketId() : int
      {
         return 560336625;
      }
   }
}

