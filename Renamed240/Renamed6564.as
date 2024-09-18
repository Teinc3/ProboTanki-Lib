package Renamed4281
{
   import Renamed189.AbstractPacket;
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   
   public class Renamed6563 extends AbstractPacket
   {
      public var captchaLocation:CaptchaLocation;
      
      public var newCaptcha:Vector.<int>;
      
      public function Renamed6563(param1:CaptchaLocation = null, param2:Vector.<int> = null)
      {
         super();
         this.captchaLocation = param1;
         this.newCaptcha = param2;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.custom.CaptchaLocationCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.custom.VectorCodecByte");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
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
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed6563();
      }
      
      override public function Renamed4883() : int
      {
         return 6;
      }
      
      override public function getPacketId() : int
      {
         return -373510957;
      }
   }
}

