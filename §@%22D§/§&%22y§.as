package §@"D§
{
   import §&#;§.AbstractPacket;
   import projects.tanks.client.achievements.model.achievements.§null package extends§;
   
   public class §&"y§ extends AbstractPacket
   {
      public var achievement:§null package extends§;
      
      public var message:String;
      
      public function §&"y§(param1:§null package extends§ = null, param2:String = "")
      {
         super();
         this.achievement = param1;
         this.message = param2;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecAchievement");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.achievement = param1 as §null package extends§;
               break;
            case 1:
               this.message = param1 as String;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §&"y§();
      }
      
      override public function §package package final§() : int
      {
         return 67;
      }
      
      override public function getPacketId() : int
      {
         return -1042583203;
      }
   }
}

