package §-Q§
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class §do set package§
   {
      private var §include set if§:SoundResource;
      
      private var §function package continue§:MultiframeImageResource;
      
      private var §throw for throw§:ImageResource;
      
      private var §case for each§:MultiframeImageResource;
      
      private var §^#]§:SoundResource;
      
      private var §finally true§:SoundResource;
      
      private var §native const each§:ImageResource;
      
      private var §include var break§:SoundResource;
      
      public function §do set package§(param1:SoundResource = null, param2:MultiframeImageResource = null, param3:ImageResource = null, param4:MultiframeImageResource = null, param5:SoundResource = null, param6:SoundResource = null, param7:ImageResource = null, param8:SoundResource = null)
      {
         super();
         this.§include set if§ = param1;
         this.§function package continue§ = param2;
         this.§throw for throw§ = param3;
         this.§case for each§ = param4;
         this.§^#]§ = param5;
         this.§finally true§ = param6;
         this.§native const each§ = param7;
         this.§include var break§ = param8;
      }
      
      public function get explosionSound() : SoundResource
      {
         return this.§include set if§;
      }
      
      public function set explosionSound(param1:SoundResource) : void
      {
         this.§include set if§ = param1;
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
      
      public function get muzzleFlashTexture() : MultiframeImageResource
      {
         return this.§case for each§;
      }
      
      public function set muzzleFlashTexture(param1:MultiframeImageResource) : void
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
      
      public function get targetingSound() : SoundResource
      {
         return this.§finally true§;
      }
      
      public function set targetingSound(param1:SoundResource) : void
      {
         this.§finally true§ = param1;
      }
      
      public function get trailTexture() : ImageResource
      {
         return this.§native const each§;
      }
      
      public function set trailTexture(param1:ImageResource) : void
      {
         this.§native const each§ = param1;
      }
      
      public function get zoomModeSound() : SoundResource
      {
         return this.§include var break§;
      }
      
      public function set zoomModeSound(param1:SoundResource) : void
      {
         this.§include var break§ = param1;
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

