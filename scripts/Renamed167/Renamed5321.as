package Renamed5317
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class Renamed5321
   {
      private var Renamed5323:MultiframeImageResource;
      
      private var Renamed5324:ImageResource;
      
      private var Renamed5325:SoundResource;
      
      private var Renamed5326:MultiframeImageResource;
      
      private var Renamed5327:ImageResource;
      
      private var Renamed5328:SoundResource;
      
      private var Renamed5329:SoundResource;
      
      public function Renamed5321(param1:MultiframeImageResource = null, param2:ImageResource = null, param3:SoundResource = null, param4:MultiframeImageResource = null, param5:ImageResource = null, param6:SoundResource = null, param7:SoundResource = null)
      {
         super();
         this.Renamed5323 = param1;
         this.Renamed5324 = param2;
         this.Renamed5325 = param3;
         this.Renamed5326 = param4;
         this.Renamed5327 = param5;
         this.Renamed5328 = param6;
         this.Renamed5329 = param7;
      }
      
      public function get damagingBall() : MultiframeImageResource
      {
         return this.Renamed5323;
      }
      
      public function set damagingBall(param1:MultiframeImageResource) : void
      {
         this.Renamed5323 = param1;
      }
      
      public function get damagingRay() : ImageResource
      {
         return this.Renamed5324;
      }
      
      public function set damagingRay(param1:ImageResource) : void
      {
         this.Renamed5324 = param1;
      }
      
      public function get damagingSound() : SoundResource
      {
         return this.Renamed5325;
      }
      
      public function set damagingSound(param1:SoundResource) : void
      {
         this.Renamed5325 = param1;
      }
      
      public function get healingBall() : MultiframeImageResource
      {
         return this.Renamed5326;
      }
      
      public function set healingBall(param1:MultiframeImageResource) : void
      {
         this.Renamed5326 = param1;
      }
      
      public function get healingRay() : ImageResource
      {
         return this.Renamed5327;
      }
      
      public function set healingRay(param1:ImageResource) : void
      {
         this.Renamed5327 = param1;
      }
      
      public function get healingSound() : SoundResource
      {
         return this.Renamed5328;
      }
      
      public function set healingSound(param1:SoundResource) : void
      {
         this.Renamed5328 = param1;
      }
      
      public function get idleSound() : SoundResource
      {
         return this.Renamed5329;
      }
      
      public function set idleSound(param1:SoundResource) : void
      {
         this.Renamed5329 = param1;
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

