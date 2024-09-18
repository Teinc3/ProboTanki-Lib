package §3""§
{
   import §&#;§.AbstractPacket;
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   
   public class §3#2§ extends AbstractPacket
   {
      public var location:CaptchaLocation;
      
      public function §3#2§(param1:CaptchaLocation = null)
      {
         super();
         this.location = param1;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.custom.CaptchaLocationCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.location = param1 as CaptchaLocation;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §3#2§();
      }
      
      override public function §package package final§() : int
      {
         return 6;
      }
      
      override public function getPacketId() : int
      {
         return -349828108;
      }
   }
}

