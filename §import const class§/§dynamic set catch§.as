package §import const class§
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class §dynamic set catch§
   {
      private var §@"b§:MultiframeImageResource;
      
      private var §function package continue§:MultiframeImageResource;
      
      private var §class const get§:SoundResource;
      
      private var §[!?§:SoundResource;
      
      private var §>"x§:ImageResource;
      
      private var §^#]§:SoundResource;
      
      private var §4#%§:MultiframeImageResource;
      
      private var §if var use§:ImageResource;
      
      public function §dynamic set catch§(param1:MultiframeImageResource = null, param2:MultiframeImageResource = null, param3:SoundResource = null, param4:SoundResource = null, param5:ImageResource = null, param6:SoundResource = null, param7:MultiframeImageResource = null, param8:ImageResource = null)
      {
         super();
         this.§@"b§ = param1;
         this.§function package continue§ = param2;
         this.§class const get§ = param3;
         this.§[!?§ = param4;
         this.§>"x§ = param5;
         this.§^#]§ = param6;
         this.§4#%§ = param7;
         this.§if var use§ = param8;
      }
      
      public function get bumpFlashTexture() : MultiframeImageResource
      {
         return this.§@"b§;
      }
      
      public function set bumpFlashTexture(param1:MultiframeImageResource) : void
      {
         this.§@"b§ = param1;
      }
      
      public function get explosionTexture() : MultiframeImageResource
      {
         return this.§function package continue§;
      }
      
      public function set explosionTexture(param1:MultiframeImageResource) : void
      {
         this.§function package continue§ = param1;
      }
      
      public function get §4"M§() : SoundResource
      {
         return this.§class const get§;
      }
      
      public function set §4"M§(param1:SoundResource) : void
      {
         this.§class const get§ = param1;
      }
      
      public function get ricochetSound() : SoundResource
      {
         return this.§[!?§;
      }
      
      public function set ricochetSound(param1:SoundResource) : void
      {
         this.§[!?§ = param1;
      }
      
      public function get shotFlashTexture() : ImageResource
      {
         return this.§>"x§;
      }
      
      public function set shotFlashTexture(param1:ImageResource) : void
      {
         this.§>"x§ = param1;
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
      
      public function get tailTrailTexutre() : ImageResource
      {
         return this.§if var use§;
      }
      
      public function set tailTrailTexutre(param1:ImageResource) : void
      {
         this.§if var use§ = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "RicochetSFXCC [";
         _loc1_ += "bumpFlashTexture = " + this.bumpFlashTexture + " ";
         _loc1_ += "explosionTexture = " + this.explosionTexture + " ";
         _loc1_ += "explostinSound = " + this.§4"M§ + " ";
         _loc1_ += "ricochetSound = " + this.ricochetSound + " ";
         _loc1_ += "shotFlashTexture = " + this.shotFlashTexture + " ";
         _loc1_ += "shotSound = " + this.shotSound + " ";
         _loc1_ += "shotTexture = " + this.shotTexture + " ";
         _loc1_ += "tailTrailTexutre = " + this.tailTrailTexutre + " ";
         return _loc1_ + "]";
      }
   }
}

