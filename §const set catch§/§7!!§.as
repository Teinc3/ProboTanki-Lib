package §const set catch§
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class §7!!§
   {
      private var §else throw§:int;
      
      private var §>!F§:MultiframeImageResource;
      
      private var §include catch static§:ImageResource;
      
      private var §catch package with§:int;
      
      private var §include set if§:SoundResource;
      
      private var §function package continue§:MultiframeImageResource;
      
      private var §^#]§:SoundResource;
      
      private var §4#%§:ImageResource;
      
      public function §7!!§(param1:int = 0, param2:MultiframeImageResource = null, param3:ImageResource = null, param4:int = 0, param5:SoundResource = null, param6:MultiframeImageResource = null, param7:SoundResource = null, param8:ImageResource = null)
      {
         super();
         this.§else throw§ = param1;
         this.§>!F§ = param2;
         this.§include catch static§ = param3;
         this.§catch package with§ = param4;
         this.§include set if§ = param5;
         this.§function package continue§ = param6;
         this.§^#]§ = param7;
         this.§4#%§ = param8;
      }
      
      public function get criticalHitSize() : int
      {
         return this.§else throw§;
      }
      
      public function set criticalHitSize(param1:int) : void
      {
         this.§else throw§ = param1;
      }
      
      public function get criticalHitTexture() : MultiframeImageResource
      {
         return this.§>!F§;
      }
      
      public function set criticalHitTexture(param1:MultiframeImageResource) : void
      {
         this.§>!F§ = param1;
      }
      
      public function get explosionMarkTexture() : ImageResource
      {
         return this.§include catch static§;
      }
      
      public function set explosionMarkTexture(param1:ImageResource) : void
      {
         this.§include catch static§ = param1;
      }
      
      public function get explosionSize() : int
      {
         return this.§catch package with§;
      }
      
      public function set explosionSize(param1:int) : void
      {
         this.§catch package with§ = param1;
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
      
      public function get shotSound() : SoundResource
      {
         return this.§^#]§;
      }
      
      public function set shotSound(param1:SoundResource) : void
      {
         this.§^#]§ = param1;
      }
      
      public function get shotTexture() : ImageResource
      {
         return this.§4#%§;
      }
      
      public function set shotTexture(param1:ImageResource) : void
      {
         this.§4#%§ = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "SmokyShootSFXCC [";
         _loc1_ += "criticalHitSize = " + this.criticalHitSize + " ";
         _loc1_ += "criticalHitTexture = " + this.criticalHitTexture + " ";
         _loc1_ += "explosionMarkTexture = " + this.explosionMarkTexture + " ";
         _loc1_ += "explosionSize = " + this.explosionSize + " ";
         _loc1_ += "explosionSound = " + this.explosionSound + " ";
         _loc1_ += "explosionTexture = " + this.explosionTexture + " ";
         _loc1_ += "shotSound = " + this.shotSound + " ";
         _loc1_ += "shotTexture = " + this.shotTexture + " ";
         return _loc1_ + "]";
      }
   }
}

