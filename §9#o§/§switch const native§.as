package §9#o§
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class §switch const native§
   {
      private var §%z§:Vector.<ImageResource>;
      
      private var §>"`§:SoundResource;
      
      private var §implements for override§:ImageResource;
      
      private var §include set finally§:SoundResource;
      
      private var §?"$§:MultiframeImageResource;
      
      private var §case var var§:MultiframeImageResource;
      
      private var §^#]§:SoundResource;
      
      private var §0"x§:MultiframeImageResource;
      
      private var § 0§:ImageResource;
      
      public function §switch const native§(param1:Vector.<ImageResource> = null, param2:SoundResource = null, param3:ImageResource = null, param4:SoundResource = null, param5:MultiframeImageResource = null, param6:MultiframeImageResource = null, param7:SoundResource = null, param8:MultiframeImageResource = null, param9:ImageResource = null)
      {
         super();
         this.§%z§ = param1;
         this.§>"`§ = param2;
         this.§implements for override§ = param3;
         this.§include set finally§ = param4;
         this.§?"$§ = param5;
         this.§case var var§ = param6;
         this.§^#]§ = param7;
         this.§0"x§ = param8;
         this.§ 0§ = param9;
      }
      
      public function get §with for set§() : Vector.<ImageResource>
      {
         return this.§%z§;
      }
      
      public function set §with for set§(param1:Vector.<ImageResource>) : void
      {
         this.§%z§ = param1;
      }
      
      public function get magazineReloadSound() : SoundResource
      {
         return this.§>"`§;
      }
      
      public function set magazineReloadSound(param1:SoundResource) : void
      {
         this.§>"`§ = param1;
      }
      
      public function get pelletTrailTexture() : ImageResource
      {
         return this.§implements for override§;
      }
      
      public function set pelletTrailTexture(param1:ImageResource) : void
      {
         this.§implements for override§ = param1;
      }
      
      public function get reloadSound() : SoundResource
      {
         return this.§include set finally§;
      }
      
      public function set reloadSound(param1:SoundResource) : void
      {
         this.§include set finally§ = param1;
      }
      
      public function get shotAcrossTexture() : MultiframeImageResource
      {
         return this.§?"$§;
      }
      
      public function set shotAcrossTexture(param1:MultiframeImageResource) : void
      {
         this.§?"$§ = param1;
      }
      
      public function get shotAlongTexture() : MultiframeImageResource
      {
         return this.§case var var§;
      }
      
      public function set shotAlongTexture(param1:MultiframeImageResource) : void
      {
         this.§case var var§ = param1;
      }
      
      public function get shotSound() : SoundResource
      {
         return this.§^#]§;
      }
      
      public function set shotSound(param1:SoundResource) : void
      {
         this.§^#]§ = param1;
      }
      
      public function get smokeTexture() : MultiframeImageResource
      {
         return this.§0"x§;
      }
      
      public function set smokeTexture(param1:MultiframeImageResource) : void
      {
         this.§0"x§ = param1;
      }
      
      public function get sparkleTexture() : ImageResource
      {
         return this.§ 0§;
      }
      
      public function set sparkleTexture(param1:ImageResource) : void
      {
         this.§ 0§ = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ShotgunSFXCC [";
         _loc1_ += "explosionMarkTextures = " + this.§with for set§ + " ";
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

