package §["@§
{
   import §&#;§.AbstractPacket;
   import projects.tanks.client.battleservice.model.statistics.§%q§;
   
   public class §default set do§ extends AbstractPacket
   {
      public var redUsers:Vector.<§%q§>;
      
      public var blueUsers:Vector.<§%q§>;
      
      public function §default set do§(param1:Vector.<§%q§> = null, param2:Vector.<§%q§> = null)
      {
         super();
         this.redUsers = param1;
         this.blueUsers = param2;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.custom.VectorCodecUserStat");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.custom.VectorCodecUserStat");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.redUsers = param1 as Vector.<§%q§>;
               break;
            case 1:
               this.blueUsers = param1 as Vector.<§%q§>;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §default set do§();
      }
      
      override public function §package package final§() : int
      {
         return 44;
      }
      
      override public function getPacketId() : int
      {
         return -1668779175;
      }
   }
}

