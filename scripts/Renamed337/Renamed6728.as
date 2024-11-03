package Renamed337
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class Renamed6728
   {
      private var Renamed7921:int;
      
      private var Renamed7922:MultiframeImageResource;
      
      private var Renamed5516:ImageResource;
      
      private var Renamed5517:int;
      
      private var Renamed5518:SoundResource;
      
      private var Renamed5519:MultiframeImageResource;
      
      private var Renamed5520:SoundResource;
      
      private var Renamed5521:ImageResource;
      
      public function Renamed6728(param1:int = 0, param2:MultiframeImageResource = null, param3:ImageResource = null, param4:int = 0, param5:SoundResource = null, param6:MultiframeImageResource = null, param7:SoundResource = null, param8:ImageResource = null)
      {
         super();
         this.Renamed7921 = param1;
         this.Renamed7922 = param2;
         this.Renamed5516 = param3;
         this.Renamed5517 = param4;
         this.Renamed5518 = param5;
         this.Renamed5519 = param6;
         this.Renamed5520 = param7;
         this.Renamed5521 = param8;
      }
      
      public function get criticalHitSize() : int
      {
         return this.Renamed7921;
      }
      
      public function set criticalHitSize(param1:int) : void
      {
         this.Renamed7921 = param1;
      }
      
      public function get criticalHitTexture() : MultiframeImageResource
      {
         return this.Renamed7922;
      }
      
      public function set criticalHitTexture(param1:MultiframeImageResource) : void
      {
         this.Renamed7922 = param1;
      }
      
      public function get explosionMarkTexture() : ImageResource
      {
         return this.Renamed5516;
      }
      
      public function set explosionMarkTexture(param1:ImageResource) : void
      {
         this.Renamed5516 = param1;
      }
      
      public function get explosionSize() : int
      {
         return this.Renamed5517;
      }
      
      public function set explosionSize(param1:int) : void
      {
         this.Renamed5517 = param1;
      }
      
      public function get explosionSound() : SoundResource
      {
         return this.Renamed5518;
      }
      
      public function set explosionSound(param1:SoundResource) : void
      {
         this.Renamed5518 = param1;
      }
      
      public function get explosionTexture() : MultiframeImageResource
      {
         return this.Renamed5519;
      }
      
      public function set explosionTexture(param1:MultiframeImageResource) : void
      {
         this.Renamed5519 = param1;
      }
      
      public function get shotSound() : SoundResource
      {
         return this.Renamed5520;
      }
      
      public function set shotSound(param1:SoundResource) : void
      {
         this.Renamed5520 = param1;
      }
      
      public function get shotTexture() : ImageResource
      {
         return this.Renamed5521;
      }
      
      public function set shotTexture(param1:ImageResource) : void
      {
         this.Renamed5521 = param1;
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

