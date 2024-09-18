package Renamed4281
{
   import AbstractPackets.AbstractPacket;
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
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CaptchaLocationCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.VectorCodecByte");
      }
      
      override public function Implement(param1:Object, param2:int) : void
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
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed6563();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 6;
      }
      
      override public function getPacketId() : int
      {
         return -373510957;
      }
   }
}

