package Renamed4281
{
   import Renamed189.AbstractPacket;
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   
   public class Renamed4289 extends AbstractPacket
   {
      public var location:CaptchaLocation;
      
      public function Renamed4289(param1:CaptchaLocation = null)
      {
         super();
         this.location = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.custom.CaptchaLocationCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.location = param1 as CaptchaLocation;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed4289();
      }
      
      override public function Renamed4883() : int
      {
         return 6;
      }
      
      override public function getPacketId() : int
      {
         return -349828108;
      }
   }
}

