package Renamed4281
{
   import Renamed189.AbstractPacket;
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   
   public class Renamed6568 extends AbstractPacket
   {
      public var captchaLocation:CaptchaLocation;
      
      public function Renamed6568(param1:CaptchaLocation = null)
      {
         super();
         this.captchaLocation = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.custom.CaptchaLocationCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.captchaLocation = param1 as CaptchaLocation;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed6568();
      }
      
      override public function Renamed4883() : int
      {
         return 6;
      }
      
      override public function getPacketId() : int
      {
         return -819536476;
      }
   }
}

