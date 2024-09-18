package Renamed4281
{
   import Renamed189.AbstractPacket;
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   
   public class Renamed4282 extends AbstractPacket
   {
      public var captchaLocation:CaptchaLocation;
      
      public var Renamed6567:String;
      
      public function Renamed4282(param1:CaptchaLocation = null, param2:String = "")
      {
         super();
         this.captchaLocation = param1;
         this.Renamed6567 = param2;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.custom.CaptchaLocationCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.captchaLocation = param1 as CaptchaLocation;
               break;
            case 1:
               this.Renamed6567 = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed4282();
      }
      
      override public function Renamed4883() : int
      {
         return 6;
      }
      
      override public function getPacketId() : int
      {
         return 1271163230;
      }
   }
}

