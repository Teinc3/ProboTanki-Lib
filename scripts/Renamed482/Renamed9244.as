package Renamed482
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class Renamed9244
   {
      private var Renamed8484:SoundResource;
      
      private var Renamed9260:ImageResource;
      
      private var Renamed9252:MultiframeImageResource;
      
      private var Renamed9253:MultiframeImageResource;
      
      private var Renamed9254:MultiframeImageResource;
      
      private var Renamed9250:SoundResource;
      
      private var Renamed8488:SoundResource;
      
      private var Renamed8487:SoundResource;
      
      private var Renamed8486:SoundResource;
      
      private var Renamed7246:MultiframeImageResource;
      
      private var Renamed9255:MultiframeImageResource;
      
      private var Renamed9251:SoundResource;
      
      private var Renamed9256:MultiframeImageResource;
      
      private var Renamed9257:ImageResource;
      
      private var Renamed8485:SoundResource;
      
      public function Renamed9244(param1:SoundResource = null, param2:ImageResource = null, param3:MultiframeImageResource = null, param4:MultiframeImageResource = null, param5:MultiframeImageResource = null, param6:SoundResource = null, param7:SoundResource = null, param8:SoundResource = null, param9:SoundResource = null, param10:MultiframeImageResource = null, param11:MultiframeImageResource = null, param12:SoundResource = null, param13:MultiframeImageResource = null, param14:ImageResource = null, param15:SoundResource = null)
      {
         super();
         this.Renamed8484 = param1;
         this.Renamed9260 = param2;
         this.Renamed9252 = param3;
         this.Renamed9253 = param4;
         this.Renamed9254 = param5;
         this.Renamed9250 = param6;
         this.Renamed8488 = param7;
         this.Renamed8487 = param8;
         this.Renamed8486 = param9;
         this.Renamed7246 = param10;
         this.Renamed9255 = param11;
         this.Renamed9251 = param12;
         this.Renamed9256 = param13;
         this.Renamed9257 = param14;
         this.Renamed8485 = param15;
      }
      
      public function get chainStartSound() : SoundResource
      {
         return this.Renamed8484;
      }
      
      public function set chainStartSound(param1:SoundResource) : void
      {
         this.Renamed8484 = param1;
      }
      
      public function get crumbsTexture() : ImageResource
      {
         return this.Renamed9260;
      }
      
      public function set crumbsTexture(param1:ImageResource) : void
      {
         this.Renamed9260 = param1;
      }
      
      public function get dustTexture() : MultiframeImageResource
      {
         return this.Renamed9252;
      }
      
      public function set dustTexture(param1:MultiframeImageResource) : void
      {
         this.Renamed9252 = param1;
      }
      
      public function get fireAcrossTexture() : MultiframeImageResource
      {
         return this.Renamed9253;
      }
      
      public function set fireAcrossTexture(param1:MultiframeImageResource) : void
      {
         this.Renamed9253 = param1;
      }
      
      public function get fireAlongTexture() : MultiframeImageResource
      {
         return this.Renamed9254;
      }
      
      public function set fireAlongTexture(param1:MultiframeImageResource) : void
      {
         this.Renamed9254 = param1;
      }
      
      public function get hitSound() : SoundResource
      {
         return this.Renamed9250;
      }
      
      public function set hitSound(param1:SoundResource) : void
      {
         this.Renamed9250 = param1;
      }
      
      public function get longFailSound() : SoundResource
      {
         return this.Renamed8488;
      }
      
      public function set longFailSound(param1:SoundResource) : void
      {
         this.Renamed8488 = param1;
      }
      
      public function get shootEndSound() : SoundResource
      {
         return this.Renamed8487;
      }
      
      public function set shootEndSound(param1:SoundResource) : void
      {
         this.Renamed8487 = param1;
      }
      
      public function get shootSound() : SoundResource
      {
         return this.Renamed8486;
      }
      
      public function set shootSound(param1:SoundResource) : void
      {
         this.Renamed8486 = param1;
      }
      
      public function get smokeTexture() : MultiframeImageResource
      {
         return this.Renamed7246;
      }
      
      public function set smokeTexture(param1:MultiframeImageResource) : void
      {
         this.Renamed7246 = param1;
      }
      
      public function get sparklesTexture() : MultiframeImageResource
      {
         return this.Renamed9255;
      }
      
      public function set sparklesTexture(param1:MultiframeImageResource) : void
      {
         this.Renamed9255 = param1;
      }
      
      public function get tankHitSound() : SoundResource
      {
         return this.Renamed9251;
      }
      
      public function set tankHitSound(param1:SoundResource) : void
      {
         this.Renamed9251 = param1;
      }
      
      public function get tankSparklesTexture() : MultiframeImageResource
      {
         return this.Renamed9256;
      }
      
      public function set tankSparklesTexture(param1:MultiframeImageResource) : void
      {
         this.Renamed9256 = param1;
      }
      
      public function get tracerTexture() : ImageResource
      {
         return this.Renamed9257;
      }
      
      public function set tracerTexture(param1:ImageResource) : void
      {
         this.Renamed9257 = param1;
      }
      
      public function get turbineStartSound() : SoundResource
      {
         return this.Renamed8485;
      }
      
      public function set turbineStartSound(param1:SoundResource) : void
      {
         this.Renamed8485 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "MachineGunSFXCC [";
         _loc1_ += "chainStartSound = " + this.chainStartSound + " ";
         _loc1_ += "crumbsTexture = " + this.crumbsTexture + " ";
         _loc1_ += "dustTexture = " + this.dustTexture + " ";
         _loc1_ += "fireAcrossTexture = " + this.fireAcrossTexture + " ";
         _loc1_ += "fireAlongTexture = " + this.fireAlongTexture + " ";
         _loc1_ += "hitSound = " + this.hitSound + " ";
         _loc1_ += "longFailSound = " + this.longFailSound + " ";
         _loc1_ += "shootEndSound = " + this.shootEndSound + " ";
         _loc1_ += "shootSound = " + this.shootSound + " ";
         _loc1_ += "smokeTexture = " + this.smokeTexture + " ";
         _loc1_ += "sparklesTexture = " + this.sparklesTexture + " ";
         _loc1_ += "tankHitSound = " + this.tankHitSound + " ";
         _loc1_ += "tankSparklesTexture = " + this.tankSparklesTexture + " ";
         _loc1_ += "tracerTexture = " + this.tracerTexture + " ";
         _loc1_ += "turbineStartSound = " + this.turbineStartSound + " ";
         return _loc1_ + "]";
      }
   }
}

