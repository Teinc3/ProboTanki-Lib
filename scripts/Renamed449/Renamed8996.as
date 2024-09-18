package Renamed449
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class Renamed8996
   {
      private var Renamed8997:ImageResource;
      
      private var Renamed8998:ImageResource;
      
      private var Renamed8999:ImageResource;
      
      private var Renamed6267:ImageResource;
      
      private var Renamed9000:MultiframeImageResource;
      
      private var Renamed9001:MultiframeImageResource;
      
      private var Renamed5520:SoundResource;
      
      private var Renamed9002:ImageResource;
      
      private var Renamed9003:MultiframeImageResource;
      
      private var Renamed9004:ImageResource;
      
      public function Renamed8996(param1:ImageResource = null, param2:ImageResource = null, param3:ImageResource = null, param4:ImageResource = null, param5:MultiframeImageResource = null, param6:MultiframeImageResource = null, param7:SoundResource = null, param8:ImageResource = null, param9:MultiframeImageResource = null, param10:ImageResource = null)
      {
         super();
         this.Renamed8997 = param1;
         this.Renamed8998 = param2;
         this.Renamed8999 = param3;
         this.Renamed6267 = param4;
         this.Renamed9000 = param5;
         this.Renamed9001 = param6;
         this.Renamed5520 = param7;
         this.Renamed9002 = param8;
         this.Renamed9003 = param9;
         this.Renamed9004 = param10;
      }
      
      public function get chargingPart1() : ImageResource
      {
         return this.Renamed8997;
      }
      
      public function set chargingPart1(param1:ImageResource) : void
      {
         this.Renamed8997 = param1;
      }
      
      public function get chargingPart2() : ImageResource
      {
         return this.Renamed8998;
      }
      
      public function set chargingPart2(param1:ImageResource) : void
      {
         this.Renamed8998 = param1;
      }
      
      public function get chargingPart3() : ImageResource
      {
         return this.Renamed8999;
      }
      
      public function set chargingPart3(param1:ImageResource) : void
      {
         this.Renamed8999 = param1;
      }
      
      public function get hitMarkTexture() : ImageResource
      {
         return this.Renamed6267;
      }
      
      public function set hitMarkTexture(param1:ImageResource) : void
      {
         this.Renamed6267 = param1;
      }
      
      public function get powTexture() : MultiframeImageResource
      {
         return this.Renamed9000;
      }
      
      public function set powTexture(param1:MultiframeImageResource) : void
      {
         this.Renamed9000 = param1;
      }
      
      public function get ringsTexture() : MultiframeImageResource
      {
         return this.Renamed9001;
      }
      
      public function set ringsTexture(param1:MultiframeImageResource) : void
      {
         this.Renamed9001 = param1;
      }
      
      public function get shotSound() : SoundResource
      {
         return this.Renamed5520;
      }
      
      public function set shotSound(param1:SoundResource) : void
      {
         this.Renamed5520 = param1;
      }
      
      public function get smokeImage() : ImageResource
      {
         return this.Renamed9002;
      }
      
      public function set smokeImage(param1:ImageResource) : void
      {
         this.Renamed9002 = param1;
      }
      
      public function get sphereTexture() : MultiframeImageResource
      {
         return this.Renamed9003;
      }
      
      public function set sphereTexture(param1:MultiframeImageResource) : void
      {
         this.Renamed9003 = param1;
      }
      
      public function get trailImage() : ImageResource
      {
         return this.Renamed9004;
      }
      
      public function set trailImage(param1:ImageResource) : void
      {
         this.Renamed9004 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "RailgunShootSFXCC [";
         _loc1_ += "chargingPart1 = " + this.chargingPart1 + " ";
         _loc1_ += "chargingPart2 = " + this.chargingPart2 + " ";
         _loc1_ += "chargingPart3 = " + this.chargingPart3 + " ";
         _loc1_ += "hitMarkTexture = " + this.hitMarkTexture + " ";
         _loc1_ += "powTexture = " + this.powTexture + " ";
         _loc1_ += "ringsTexture = " + this.ringsTexture + " ";
         _loc1_ += "shotSound = " + this.shotSound + " ";
         _loc1_ += "smokeImage = " + this.smokeImage + " ";
         _loc1_ += "sphereTexture = " + this.sphereTexture + " ";
         _loc1_ += "trailImage = " + this.trailImage + " ";
         return _loc1_ + "]";
      }
   }
}

