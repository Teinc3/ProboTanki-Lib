package §8#@§
{
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class §final const continue§
   {
      private var § #2§:MultiframeImageResource;
      
      private var §const const var§:SoundResource;
      
      private var §3j§:MultiframeImageResource;
      
      public function §final const continue§(param1:MultiframeImageResource = null, param2:SoundResource = null, param3:MultiframeImageResource = null)
      {
         super();
         this.§ #2§ = param1;
         this.§const const var§ = param2;
         this.§3j§ = param3;
      }
      
      public function get fireTexture() : MultiframeImageResource
      {
         return this.§ #2§;
      }
      
      public function set fireTexture(param1:MultiframeImageResource) : void
      {
         this.§ #2§ = param1;
      }
      
      public function get flameSound() : SoundResource
      {
         return this.§const const var§;
      }
      
      public function set flameSound(param1:SoundResource) : void
      {
         this.§const const var§ = param1;
      }
      
      public function get muzzlePlaneTexture() : MultiframeImageResource
      {
         return this.§3j§;
      }
      
      public function set muzzlePlaneTexture(param1:MultiframeImageResource) : void
      {
         this.§3j§ = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "FlameThrowingSFXCC [";
         _loc1_ += "fireTexture = " + this.fireTexture + " ";
         _loc1_ += "flameSound = " + this.flameSound + " ";
         _loc1_ += "muzzlePlaneTexture = " + this.muzzlePlaneTexture + " ";
         return _loc1_ + "]";
      }
   }
}

