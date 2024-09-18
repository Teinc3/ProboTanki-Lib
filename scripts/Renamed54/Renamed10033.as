package Renamed54
{
   public class Renamed55
   {
      private var Renamed7770:Number;
      
      private var Renamed10030:Number;
      
      private var Renamed10031:Number;
      
      private var Renamed10032:Number;
      
      public function Renamed55(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:Number = 0)
      {
         super();
         this.Renamed7770 = param1;
         this.Renamed10030 = param2;
         this.Renamed10031 = param3;
         this.Renamed10032 = param4;
      }
      
      public function get impactForce() : Number
      {
         return this.Renamed7770;
      }
      
      public function set impactForce(param1:Number) : void
      {
         this.Renamed7770 = param1;
      }
      
      public function get minSplashDamagePercent() : Number
      {
         return this.Renamed10030;
      }
      
      public function set minSplashDamagePercent(param1:Number) : void
      {
         this.Renamed10030 = param1;
      }
      
      public function get radiusOfMaxSplashDamage() : Number
      {
         return this.Renamed10031;
      }
      
      public function set radiusOfMaxSplashDamage(param1:Number) : void
      {
         this.Renamed10031 = param1;
      }
      
      public function get splashDamageRadius() : Number
      {
         return this.Renamed10032;
      }
      
      public function set splashDamageRadius(param1:Number) : void
      {
         this.Renamed10032 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "SplashCC [";
         _loc1_ += "impactForce = " + this.impactForce + " ";
         _loc1_ += "minSplashDamagePercent = " + this.minSplashDamagePercent + " ";
         _loc1_ += "radiusOfMaxSplashDamage = " + this.radiusOfMaxSplashDamage + " ";
         _loc1_ += "splashDamageRadius = " + this.splashDamageRadius + " ";
         return _loc1_ + "]";
      }
   }
}

