package Renamed285
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class Renamed6437
   {
      private var Renamed7240:Vector.<ImageResource>;
      
      private var Renamed7241:SoundResource;
      
      private var Renamed7242:ImageResource;
      
      private var Renamed7243:SoundResource;
      
      private var Renamed7244:MultiframeImageResource;
      
      private var Renamed7245:MultiframeImageResource;
      
      private var Renamed5520:SoundResource;
      
      private var Renamed7246:MultiframeImageResource;
      
      private var Renamed7247:ImageResource;
      
      public function Renamed6437(param1:Vector.<ImageResource> = null, param2:SoundResource = null, param3:ImageResource = null, param4:SoundResource = null, param5:MultiframeImageResource = null, param6:MultiframeImageResource = null, param7:SoundResource = null, param8:MultiframeImageResource = null, param9:ImageResource = null)
      {
         super();
         this.Renamed7240 = param1;
         this.Renamed7241 = param2;
         this.Renamed7242 = param3;
         this.Renamed7243 = param4;
         this.Renamed7244 = param5;
         this.Renamed7245 = param6;
         this.Renamed5520 = param7;
         this.Renamed7246 = param8;
         this.Renamed7247 = param9;
      }
      
      public function get Renamed6440() : Vector.<ImageResource>
      {
         return this.Renamed7240;
      }
      
      public function set Renamed6440(param1:Vector.<ImageResource>) : void
      {
         this.Renamed7240 = param1;
      }
      
      public function get magazineReloadSound() : SoundResource
      {
         return this.Renamed7241;
      }
      
      public function set magazineReloadSound(param1:SoundResource) : void
      {
         this.Renamed7241 = param1;
      }
      
      public function get pelletTrailTexture() : ImageResource
      {
         return this.Renamed7242;
      }
      
      public function set pelletTrailTexture(param1:ImageResource) : void
      {
         this.Renamed7242 = param1;
      }
      
      public function get reloadSound() : SoundResource
      {
         return this.Renamed7243;
      }
      
      public function set reloadSound(param1:SoundResource) : void
      {
         this.Renamed7243 = param1;
      }
      
      public function get shotAcrossTexture() : MultiframeImageResource
      {
         return this.Renamed7244;
      }
      
      public function set shotAcrossTexture(param1:MultiframeImageResource) : void
      {
         this.Renamed7244 = param1;
      }
      
      public function get shotAlongTexture() : MultiframeImageResource
      {
         return this.Renamed7245;
      }
      
      public function set shotAlongTexture(param1:MultiframeImageResource) : void
      {
         this.Renamed7245 = param1;
      }
      
      public function get shotSound() : SoundResource
      {
         return this.Renamed5520;
      }
      
      public function set shotSound(param1:SoundResource) : void
      {
         this.Renamed5520 = param1;
      }
      
      public function get smokeTexture() : MultiframeImageResource
      {
         return this.Renamed7246;
      }
      
      public function set smokeTexture(param1:MultiframeImageResource) : void
      {
         this.Renamed7246 = param1;
      }
      
      public function get sparkleTexture() : ImageResource
      {
         return this.Renamed7247;
      }
      
      public function set sparkleTexture(param1:ImageResource) : void
      {
         this.Renamed7247 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ShotgunSFXCC [";
         _loc1_ += "explosionMarkTextures = " + this.Renamed6440 + " ";
         _loc1_ += "magazineReloadSound = " + this.magazineReloadSound + " ";
         _loc1_ += "pelletTrailTexture = " + this.pelletTrailTexture + " ";
         _loc1_ += "reloadSound = " + this.reloadSound + " ";
         _loc1_ += "shotAcrossTexture = " + this.shotAcrossTexture + " ";
         _loc1_ += "shotAlongTexture = " + this.shotAlongTexture + " ";
         _loc1_ += "shotSound = " + this.shotSound + " ";
         _loc1_ += "smokeTexture = " + this.smokeTexture + " ";
         _loc1_ += "sparkleTexture = " + this.sparkleTexture + " ";
         return _loc1_ + "]";
      }
   }
}

