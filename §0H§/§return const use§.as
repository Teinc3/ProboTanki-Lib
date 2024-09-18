package §0H§
{
   import §&#;§.AbstractPacket;
   import projects.tanks.client.battleservice.model.statistics.§%q§;
   
   public class §return const use§ extends AbstractPacket
   {
      public var usersStat:Vector.<§%q§>;
      
      public function §return const use§(param1:Vector.<§%q§> = null)
      {
         super();
         this.usersStat = param1;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.custom.VectorCodecUserStat");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.usersStat = param1 as Vector.<§%q§>;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §return const use§();
      }
      
      override public function §package package final§() : int
      {
         return 48;
      }
      
      override public function getPacketId() : int
      {
         return 1061006142;
      }
   }
}

