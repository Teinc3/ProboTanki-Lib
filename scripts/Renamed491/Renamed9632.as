package Renamed491
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class Renamed9631
   {
      private var Renamed5519:MultiframeImageResource;
      
      private var Renamed6267:ImageResource;
      
      private var Renamed6268:ImageResource;
      
      private var Renamed5520:SoundResource;
      
      private var Renamed5521:MultiframeImageResource;
      
      public function Renamed9631(param1:MultiframeImageResource = null, param2:ImageResource = null, param3:ImageResource = null, param4:SoundResource = null, param5:MultiframeImageResource = null)
      {
         super();
         this.Renamed5519 = param1;
         this.Renamed6267 = param2;
         this.Renamed6268 = param3;
         this.Renamed5520 = param4;
         this.Renamed5521 = param5;
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
      
      public function get muzzleFlashTexture() : ImageResource
      {
         return this.Renamed6268;
      }
      
      public function set muzzleFlashTexture(param1:ImageResource) : void
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
      
      public function get shotTexture() : MultiframeImageResource
      {
         return this.Renamed5521;
      }
      
      public function set shotTexture(param1:MultiframeImageResource) : void
      {
         this.Renamed5521 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "TwinsShootSFXCC [";
         _loc1_ += "explosionTexture = " + this.explosionTexture + " ";
         _loc1_ += "hitMarkTexture = " + this.hitMarkTexture + " ";
         _loc1_ += "muzzleFlashTexture = " + this.muzzleFlashTexture + " ";
         _loc1_ += "shotSound = " + this.shotSound + " ";
         _loc1_ += "shotTexture = " + this.shotTexture + " ";
         return _loc1_ + "]";
      }
   }
}

