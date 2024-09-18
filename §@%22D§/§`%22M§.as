package §@"D§
{
   import §&#;§.AbstractPacket;
   import projects.tanks.client.achievements.model.achievements.§null package extends§;
   
   public class §`"M§ extends AbstractPacket
   {
      public var achievement:§null package extends§;
      
      public function §`"M§(param1:§null package extends§ = null)
      {
         super();
         this.achievement = param1;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecAchievement");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.achievement = param1 as §null package extends§;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §`"M§();
      }
      
      override public function §package package final§() : int
      {
         return 67;
      }
      
      override public function getPacketId() : int
      {
         return 579696867;
      }
   }
}

