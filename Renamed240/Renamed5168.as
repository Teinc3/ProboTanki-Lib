package Renamed4281
{
   import Renamed189.AbstractPacket;
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   
   public class Renamed5168 extends AbstractPacket
   {
      public var initParams:Vector.<CaptchaLocation>;
      
      public function Renamed5168(param1:Vector.<CaptchaLocation> = null)
      {
         super();
         this.initParams = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.custom.VectorCodecCaptchaLocation");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.initParams = param1 as Vector.<CaptchaLocation>;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed5168();
      }
      
      override public function Renamed4883() : int
      {
         return 6;
      }
      
      override public function getPacketId() : int
      {
         return 321971701;
      }
   }
}

