package §;l§
{
   import §&#;§.AbstractPacket;
   import projects.tanks.client.battlefield.models.bonus.battle.§1§;
   
   public class §extends set native§ extends AbstractPacket
   {
      public var §?>§:Vector.<§1#1§>;
      
      public function §extends set native§(param1:Vector.<§1#1§> = null)
      {
         super();
         this.§?>§ = param1;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.custom.VectorCodecBonusSpawnData");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.§?>§ = param1 as Vector.<§1#1§>;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §extends set native§();
      }
      
      override public function §package package final§() : int
      {
         return 41;
      }
      
      override public function getPacketId() : int
      {
         return -1205151619;
      }
   }
}

