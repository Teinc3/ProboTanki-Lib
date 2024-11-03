package Renamed391
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class Renamed8434
   {
      private var Renamed8435:MultiframeImageResource;
      
      private var Renamed5519:MultiframeImageResource;
      
      private var Renamed8436:SoundResource;
      
      private var Renamed8437:SoundResource;
      
      private var Renamed8438:ImageResource;
      
      private var Renamed5520:SoundResource;
      
      private var Renamed5521:MultiframeImageResource;
      
      private var Renamed8439:ImageResource;
      
      public function Renamed8434(param1:MultiframeImageResource = null, param2:MultiframeImageResource = null, param3:SoundResource = null, param4:SoundResource = null, param5:ImageResource = null, param6:SoundResource = null, param7:MultiframeImageResource = null, param8:ImageResource = null)
      {
         super();
         this.Renamed8435 = param1;
         this.Renamed5519 = param2;
         this.Renamed8436 = param3;
         this.Renamed8437 = param4;
         this.Renamed8438 = param5;
         this.Renamed5520 = param6;
         this.Renamed5521 = param7;
         this.Renamed8439 = param8;
      }
      
      public function get bumpFlashTexture() : MultiframeImageResource
      {
         return this.Renamed8435;
      }
      
      public function set bumpFlashTexture(param1:MultiframeImageResource) : void
      {
         this.Renamed8435 = param1;
      }
      
      public function get explosionTexture() : MultiframeImageResource
      {
         return this.Renamed5519;
      }
      
      public function set explosionTexture(param1:MultiframeImageResource) : void
      {
         this.Renamed5519 = param1;
      }
      
      public function get Renamed8440() : SoundResource
      {
         return this.Renamed8436;
      }
      
      public function set Renamed8440(param1:SoundResource) : void
      {
         this.Renamed8436 = param1;
      }
      
      public function get ricochetSound() : SoundResource
      {
         return this.Renamed8437;
      }
      
      public function set ricochetSound(param1:SoundResource) : void
      {
         this.Renamed8437 = param1;
      }
      
      public function get shotFlashTexture() : ImageResource
      {
         return this.Renamed8438;
      }
      
      public function set shotFlashTexture(param1:ImageResource) : void
      {
         this.Renamed8438 = param1;
      }
      
      public function get shotSound() : SoundResource
      {
         return this.Renamed5520;
      }
      
      public function set shotSound(param1:SoundResource) : void
      {
         this.Renamed5520 = param1;
      }
      
      public function get shotTexture() : MultiframeImageResource
      {
         return this.Renamed5521;
      }
      
      public function set shotTexture(param1:MultiframeImageResource) : void
      {
         this.Renamed5521 = param1;
      }
      
      public function get tailTrailTexutre() : ImageResource
      {
         return this.Renamed8439;
      }
      
      public function set tailTrailTexutre(param1:ImageResource) : void
      {
         this.Renamed8439 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "RicochetSFXCC [";
         _loc1_ += "bumpFlashTexture = " + this.bumpFlashTexture + " ";
         _loc1_ += "explosionTexture = " + this.explosionTexture + " ";
         _loc1_ += "explostinSound = " + this.Renamed8440 + " ";
         _loc1_ += "ricochetSound = " + this.ricochetSound + " ";
         _loc1_ += "shotFlashTexture = " + this.shotFlashTexture + " ";
         _loc1_ += "shotSound = " + this.shotSound + " ";
         _loc1_ += "shotTexture = " + this.shotTexture + " ";
         _loc1_ += "tailTrailTexutre = " + this.tailTrailTexutre + " ";
         return _loc1_ + "]";
      }
   }
}

