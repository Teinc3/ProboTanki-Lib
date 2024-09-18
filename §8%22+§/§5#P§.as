package §8"+§
{
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   
   public class §5#P§
   {
      private var §function package continue§:MultiframeImageResource;
      
      private var §with var set§:MultiframeImageResource;
      
      private var §get throw§:MultiframeImageResource;
      
      public function §5#P§(param1:MultiframeImageResource = null, param2:MultiframeImageResource = null, param3:MultiframeImageResource = null)
      {
         super();
         this.§function package continue§ = param1;
         this.§with var set§ = param2;
         this.§get throw§ = param3;
      }
      
      public function get explosionTexture() : MultiframeImageResource
      {
         return this.§function package continue§;
      }
      
      public function set explosionTexture(param1:MultiframeImageResource) : void
      {
         this.§function package continue§ = param1;
      }
      
      public function get §^#e§() : MultiframeImageResource
      {
         return this.§with var set§;
      }
      
      public function set §^#e§(param1:MultiframeImageResource) : void
      {
         this.§with var set§ = param1;
      }
      
      public function get §&"6§() : MultiframeImageResource
      {
         return this.§get throw§;
      }
      
      public function set §&"6§(param1:MultiframeImageResource) : void
      {
         this.§get throw§ = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "TankExplosionCC [";
         _loc1_ += "explosionTexture = " + this.explosionTexture + " ";
         _loc1_ += "shockWaveTexture = " + this.§^#e§ + " ";
         _loc1_ += "smokeTextureId = " + this.§&"6§ + " ";
         return _loc1_ + "]";
      }
   }
}

