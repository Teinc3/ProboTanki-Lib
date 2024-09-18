package §3""§
{
   import §&#;§.AbstractPacket;
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   
   public class §-!A§ extends AbstractPacket
   {
      public var captchaLocation:CaptchaLocation;
      
      public var §9-§:String;
      
      public function §-!A§(param1:CaptchaLocation = null, param2:String = "")
      {
         super();
         this.captchaLocation = param1;
         this.§9-§ = param2;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.custom.CaptchaLocationCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.captchaLocation = param1 as CaptchaLocation;
               break;
            case 1:
               this.§9-§ = param1 as String;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §-!A§();
      }
      
      override public function §package package final§() : int
      {
         return 6;
      }
      
      override public function getPacketId() : int
      {
         return 1271163230;
      }
   }
}

