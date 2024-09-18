package §3""§
{
   import §&#;§.AbstractPacket;
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   
   public class §dynamic const use§ extends AbstractPacket
   {
      public var initParams:Vector.<CaptchaLocation>;
      
      public function §dynamic const use§(param1:Vector.<CaptchaLocation> = null)
      {
         super();
         this.initParams = param1;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.custom.VectorCodecCaptchaLocation");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.initParams = param1 as Vector.<CaptchaLocation>;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §dynamic const use§();
      }
      
      override public function §package package final§() : int
      {
         return 6;
      }
      
      override public function getPacketId() : int
      {
         return 321971701;
      }
   }
}

