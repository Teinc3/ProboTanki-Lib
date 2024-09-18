package projects.tanks.client.entrance.model.entrance.captcha
{
   public class Renamed4279
   {
      private var Renamed4280:Vector.<CaptchaLocation>;
      
      public function Renamed4279(param1:Vector.<CaptchaLocation> = null)
      {
         super();
         this.Renamed4280 = param1;
      }
      
      public function get Renamed3548() : Vector.<CaptchaLocation>
      {
         return this.Renamed4280;
      }
      
      public function set Renamed3548(param1:Vector.<CaptchaLocation>) : void
      {
         this.Renamed4280 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "CaptchaCC [";
         _loc1_ += "stateWithCaptcha = " + this.Renamed3548 + " ";
         return _loc1_ + "]";
      }
   }
}

