package §<#&§
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class §7B§
   {
      private var §true var throw§:MultiframeImageResource;
      
      private var §use var override§:ImageResource;
      
      private var §]![§:SoundResource;
      
      private var §in set native§:MultiframeImageResource;
      
      private var §+"<§:ImageResource;
      
      private var §static const package§:SoundResource;
      
      private var §,!V§:SoundResource;
      
      public function §7B§(param1:MultiframeImageResource = null, param2:ImageResource = null, param3:SoundResource = null, param4:MultiframeImageResource = null, param5:ImageResource = null, param6:SoundResource = null, param7:SoundResource = null)
      {
         super();
         this.§true var throw§ = param1;
         this.§use var override§ = param2;
         this.§]![§ = param3;
         this.§in set native§ = param4;
         this.§+"<§ = param5;
         this.§static const package§ = param6;
         this.§,!V§ = param7;
      }
      
      public function get damagingBall() : MultiframeImageResource
      {
         return this.§true var throw§;
      }
      
      public function set damagingBall(param1:MultiframeImageResource) : void
      {
         this.§true var throw§ = param1;
      }
      
      public function get damagingRay() : ImageResource
      {
         return this.§use var override§;
      }
      
      public function set damagingRay(param1:ImageResource) : void
      {
         this.§use var override§ = param1;
      }
      
      public function get damagingSound() : SoundResource
      {
         return this.§]![§;
      }
      
      public function set damagingSound(param1:SoundResource) : void
      {
         this.§]![§ = param1;
      }
      
      public function get healingBall() : MultiframeImageResource
      {
         return this.§in set native§;
      }
      
      public function set healingBall(param1:MultiframeImageResource) : void
      {
         this.§in set native§ = param1;
      }
      
      public function get healingRay() : ImageResource
      {
         return this.§+"<§;
      }
      
      public function set healingRay(param1:ImageResource) : void
      {
         this.§+"<§ = param1;
      }
      
      public function get healingSound() : SoundResource
      {
         return this.§static const package§;
      }
      
      public function set healingSound(param1:SoundResource) : void
      {
         this.§static const package§ = param1;
      }
      
      public function get idleSound() : SoundResource
      {
         return this.§,!V§;
      }
      
      public function set idleSound(param1:SoundResource) : void
      {
         this.§,!V§ = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "IsisSFXCC [";
         _loc1_ += "damagingBall = " + this.damagingBall + " ";
         _loc1_ += "damagingRay = " + this.damagingRay + " ";
         _loc1_ += "damagingSound = " + this.damagingSound + " ";
         _loc1_ += "healingBall = " + this.healingBall + " ";
         _loc1_ += "healingRay = " + this.healingRay + " ";
         _loc1_ += "healingSound = " + this.healingSound + " ";
         _loc1_ += "idleSound = " + this.idleSound + " ";
         return _loc1_ + "]";
      }
   }
}

