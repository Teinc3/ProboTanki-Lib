package Renamed4605
{
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   
   public class Renamed7110
   {
      private var Renamed5519:MultiframeImageResource;
      
      private var Renamed7111:MultiframeImageResource;
      
      private var Renamed7112:MultiframeImageResource;
      
      public function Renamed7110(param1:MultiframeImageResource = null, param2:MultiframeImageResource = null, param3:MultiframeImageResource = null)
      {
         super();
         this.Renamed5519 = param1;
         this.Renamed7111 = param2;
         this.Renamed7112 = param3;
      }
      
      public function get explosionTexture() : MultiframeImageResource
      {
         return this.Renamed5519;
      }
      
      public function set explosionTexture(param1:MultiframeImageResource) : void
      {
         this.Renamed5519 = param1;
      }
      
      public function get Renamed7113() : MultiframeImageResource
      {
         return this.Renamed7111;
      }
      
      public function set Renamed7113(param1:MultiframeImageResource) : void
      {
         this.Renamed7111 = param1;
      }
      
      public function get Renamed7114() : MultiframeImageResource
      {
         return this.Renamed7112;
      }
      
      public function set Renamed7114(param1:MultiframeImageResource) : void
      {
         this.Renamed7112 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "TankExplosionCC [";
         _loc1_ += "explosionTexture = " + this.explosionTexture + " ";
         _loc1_ += "shockWaveTexture = " + this.Renamed7113 + " ";
         _loc1_ += "smokeTextureId = " + this.Renamed7114 + " ";
         return _loc1_ + "]";
      }
   }
}

