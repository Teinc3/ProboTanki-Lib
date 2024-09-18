package §>!X§
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class §in each§
   {
      private var §include catch static§:ImageResource;
      
      private var §catch package with§:Number;
      
      private var §include set if§:SoundResource;
      
      private var §function package continue§:MultiframeImageResource;
      
      private var §^#]§:SoundResource;
      
      private var §4#%§:ImageResource;
      
      public function §in each§(param1:ImageResource = null, param2:Number = 0, param3:SoundResource = null, param4:MultiframeImageResource = null, param5:SoundResource = null, param6:ImageResource = null)
      {
         super();
         this.§include catch static§ = param1;
         this.§catch package with§ = param2;
         this.§include set if§ = param3;
         this.§function package continue§ = param4;
         this.§^#]§ = param5;
         this.§4#%§ = param6;
      }
      
      public function get explosionMarkTexture() : ImageResource
      {
         return this.§include catch static§;
      }
      
      public function set explosionMarkTexture(param1:ImageResource) : void
      {
         this.§include catch static§ = param1;
      }
      
      public function get explosionSize() : Number
      {
         return this.§catch package with§;
      }
      
      public function set explosionSize(param1:Number) : void
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
         var _loc1_:String = "ThunderShootSFXCC [";
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

