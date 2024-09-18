package §3""§
{
   import §&#;§.AbstractPacket;
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   
   public class §<q§ extends AbstractPacket
   {
      public var captchaLocation:CaptchaLocation;
      
      public var newCaptcha:Vector.<int>;
      
      public function §<q§(param1:CaptchaLocation = null, param2:Vector.<int> = null)
      {
         super();
         this.captchaLocation = param1;
         this.newCaptcha = param2;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.custom.CaptchaLocationCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.custom.VectorCodecByte");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.captchaLocation = param1 as CaptchaLocation;
               break;
            case 1:
               this.newCaptcha = param1 as Vector.<int>;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §<q§();
      }
      
      override public function §package package final§() : int
      {
         return 6;
      }
      
      override public function getPacketId() : int
      {
         return -373510957;
      }
   }
}

