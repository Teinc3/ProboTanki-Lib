package Renamed273
{
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class Renamed7105
   {
      private var Renamed7106:MultiframeImageResource;
      
      private var Renamed7107:SoundResource;
      
      private var Renamed7108:MultiframeImageResource;
      
      public function Renamed7105(param1:MultiframeImageResource = null, param2:SoundResource = null, param3:MultiframeImageResource = null)
      {
         super();
         this.Renamed7106 = param1;
         this.Renamed7107 = param2;
         this.Renamed7108 = param3;
      }
      
      public function get fireTexture() : MultiframeImageResource
      {
         return this.Renamed7106;
      }
      
      public function set fireTexture(param1:MultiframeImageResource) : void
      {
         this.Renamed7106 = param1;
      }
      
      public function get flameSound() : SoundResource
      {
         return this.Renamed7107;
      }
      
      public function set flameSound(param1:SoundResource) : void
      {
         this.Renamed7107 = param1;
      }
      
      public function get muzzlePlaneTexture() : MultiframeImageResource
      {
         return this.Renamed7108;
      }
      
      public function set muzzlePlaneTexture(param1:MultiframeImageResource) : void
      {
         this.Renamed7108 = param1;
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

