package §final package set§
{
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class §`"B§
   {
      private var §0#9§:SoundResource;
      
      private var §implements package break§:SoundResource;
      
      private var §<3§:SoundResource;
      
      private var §override use§:SoundResource;
      
      private var §"!H§:SoundResource;
      
      public function §`"B§(param1:SoundResource = null, param2:SoundResource = null, param3:SoundResource = null, param4:SoundResource = null, param5:SoundResource = null)
      {
         super();
         this.§0#9§ = param1;
         this.§implements package break§ = param2;
         this.§<3§ = param3;
         this.§override use§ = param4;
         this.§"!H§ = param5;
      }
      
      public function get engineIdleSound() : SoundResource
      {
         return this.§0#9§;
      }
      
      public function set engineIdleSound(param1:SoundResource) : void
      {
         this.§0#9§ = param1;
      }
      
      public function get engineMovingSound() : SoundResource
      {
         return this.§implements package break§;
      }
      
      public function set engineMovingSound(param1:SoundResource) : void
      {
         this.§implements package break§ = param1;
      }
      
      public function get engineStartMovingSound() : SoundResource
      {
         return this.§<3§;
      }
      
      public function set engineStartMovingSound(param1:SoundResource) : void
      {
         this.§<3§ = param1;
      }
      
      public function get §null catch with§() : SoundResource
      {
         return this.§override use§;
      }
      
      public function set §null catch with§(param1:SoundResource) : void
      {
         this.§override use§ = param1;
      }
      
      public function get §1#?§() : SoundResource
      {
         return this.§"!H§;
      }
      
      public function set §1#?§(param1:SoundResource) : void
      {
         this.§"!H§ = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "EngineCC [";
         _loc1_ += "engineIdleSound = " + this.engineIdleSound + " ";
         _loc1_ += "engineMovingSound = " + this.engineMovingSound + " ";
         _loc1_ += "engineStartMovingSound = " + this.engineStartMovingSound + " ";
         _loc1_ += "engineStartSound = " + this.§null catch with§ + " ";
         _loc1_ += "engineStopMovingSound = " + this.§1#?§ + " ";
         return _loc1_ + "]";
      }
   }
}

