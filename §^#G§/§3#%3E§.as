package §^#G§
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class §3#>§
   {
      private var §function package continue§:MultiframeImageResource;
      
      private var §throw for throw§:ImageResource;
      
      private var §case for each§:ImageResource;
      
      private var §^#]§:SoundResource;
      
      private var §4#%§:MultiframeImageResource;
      
      public function §3#>§(param1:MultiframeImageResource = null, param2:ImageResource = null, param3:ImageResource = null, param4:SoundResource = null, param5:MultiframeImageResource = null)
      {
         super();
         this.§function package continue§ = param1;
         this.§throw for throw§ = param2;
         this.§case for each§ = param3;
         this.§^#]§ = param4;
         this.§4#%§ = param5;
      }
      
      public function get explosionTexture() : MultiframeImageResource
      {
         return this.§function package continue§;
      }
      
      public function set explosionTexture(param1:MultiframeImageResource) : void
      {
         this.§function package continue§ = param1;
      }
      
      public function get hitMarkTexture() : ImageResource
      {
         return this.§throw for throw§;
      }
      
      public function set hitMarkTexture(param1:ImageResource) : void
      {
         this.§throw for throw§ = param1;
      }
      
      public function get muzzleFlashTexture() : ImageResource
      {
         return this.§case for each§;
      }
      
      public function set muzzleFlashTexture(param1:ImageResource) : void
      {
         this.§case for each§ = param1;
      }
      
      public function get shotSound() : SoundResource
      {
         return this.§^#]§;
      }
      
      public function set shotSound(param1:SoundResource) : void
      {
         this.§^#]§ = param1;
      }
      
      public function get shotTexture() : MultiframeImageResource
      {
         return this.§4#%§;
      }
      
      public function set shotTexture(param1:MultiframeImageResource) : void
      {
         this.§4#%§ = param1;
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

