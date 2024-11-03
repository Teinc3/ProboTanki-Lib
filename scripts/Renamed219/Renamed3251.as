package Renamed219
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class Renamed3251
   {
      private var Renamed5518:SoundResource;
      
      private var Renamed5519:MultiframeImageResource;
      
      private var Renamed6267:ImageResource;
      
      private var Renamed6268:MultiframeImageResource;
      
      private var Renamed5520:SoundResource;
      
      private var Renamed6269:SoundResource;
      
      private var Renamed6270:ImageResource;
      
      private var Renamed6271:SoundResource;
      
      public function Renamed3251(param1:SoundResource = null, param2:MultiframeImageResource = null, param3:ImageResource = null, param4:MultiframeImageResource = null, param5:SoundResource = null, param6:SoundResource = null, param7:ImageResource = null, param8:SoundResource = null)
      {
         super();
         this.Renamed5518 = param1;
         this.Renamed5519 = param2;
         this.Renamed6267 = param3;
         this.Renamed6268 = param4;
         this.Renamed5520 = param5;
         this.Renamed6269 = param6;
         this.Renamed6270 = param7;
         this.Renamed6271 = param8;
      }
      
      public function get explosionSound() : SoundResource
      {
         return this.Renamed5518;
      }
      
      public function set explosionSound(param1:SoundResource) : void
      {
         this.Renamed5518 = param1;
      }
      
      public function get explosionTexture() : MultiframeImageResource
      {
         return this.Renamed5519;
      }
      
      public function set explosionTexture(param1:MultiframeImageResource) : void
      {
         this.Renamed5519 = param1;
      }
      
      public function get hitMarkTexture() : ImageResource
      {
         return this.Renamed6267;
      }
      
      public function set hitMarkTexture(param1:ImageResource) : void
      {
         this.Renamed6267 = param1;
      }
      
      public function get muzzleFlashTexture() : MultiframeImageResource
      {
         return this.Renamed6268;
      }
      
      public function set muzzleFlashTexture(param1:MultiframeImageResource) : void
      {
         this.Renamed6268 = param1;
      }
      
      public function get shotSound() : SoundResource
      {
         return this.Renamed5520;
      }
      
      public function set shotSound(param1:SoundResource) : void
      {
         this.Renamed5520 = param1;
      }
      
      public function get targetingSound() : SoundResource
      {
         return this.Renamed6269;
      }
      
      public function set targetingSound(param1:SoundResource) : void
      {
         this.Renamed6269 = param1;
      }
      
      public function get trailTexture() : ImageResource
      {
         return this.Renamed6270;
      }
      
      public function set trailTexture(param1:ImageResource) : void
      {
         this.Renamed6270 = param1;
      }
      
      public function get zoomModeSound() : SoundResource
      {
         return this.Renamed6271;
      }
      
      public function set zoomModeSound(param1:SoundResource) : void
      {
         this.Renamed6271 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ShaftShootSFXCC [";
         _loc1_ += "explosionSound = " + this.explosionSound + " ";
         _loc1_ += "explosionTexture = " + this.explosionTexture + " ";
         _loc1_ += "hitMarkTexture = " + this.hitMarkTexture + " ";
         _loc1_ += "muzzleFlashTexture = " + this.muzzleFlashTexture + " ";
         _loc1_ += "shotSound = " + this.shotSound + " ";
         _loc1_ += "targetingSound = " + this.targetingSound + " ";
         _loc1_ += "trailTexture = " + this.trailTexture + " ";
         _loc1_ += "zoomModeSound = " + this.zoomModeSound + " ";
         return _loc1_ + "]";
      }
   }
}

