package Renamed5511
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class Renamed5515
   {
      private var Renamed5516:ImageResource;
      
      private var Renamed5517:Number;
      
      private var Renamed5518:SoundResource;
      
      private var Renamed5519:MultiframeImageResource;
      
      private var Renamed5520:SoundResource;
      
      private var Renamed5521:ImageResource;
      
      public function Renamed5515(param1:ImageResource = null, param2:Number = 0, param3:SoundResource = null, param4:MultiframeImageResource = null, param5:SoundResource = null, param6:ImageResource = null)
      {
         super();
         this.Renamed5516 = param1;
         this.Renamed5517 = param2;
         this.Renamed5518 = param3;
         this.Renamed5519 = param4;
         this.Renamed5520 = param5;
         this.Renamed5521 = param6;
      }
      
      public function get explosionMarkTexture() : ImageResource
      {
         return this.Renamed5516;
      }
      
      public function set explosionMarkTexture(param1:ImageResource) : void
      {
         this.Renamed5516 = param1;
      }
      
      public function get explosionSize() : Number
      {
         return this.Renamed5517;
      }
      
      public function set explosionSize(param1:Number) : void
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

