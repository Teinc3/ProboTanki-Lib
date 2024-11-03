package Renamed217
{
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class Renamed6255
   {
      private var Renamed6257:Number;
      
      private var Renamed6258:MultiframeImageResource;
      
      private var Renamed6259:MultiframeImageResource;
      
      private var Renamed6260:SoundResource;
      
      public function Renamed6255(param1:Number = 0, param2:MultiframeImageResource = null, param3:MultiframeImageResource = null, param4:SoundResource = null)
      {
         super();
         this.Renamed6257 = param1;
         this.Renamed6258 = param2;
         this.Renamed6259 = param3;
         this.Renamed6260 = param4;
      }
      
      public function get particleSpeed() : Number
      {
         return this.Renamed6257;
      }
      
      public function set particleSpeed(param1:Number) : void
      {
         this.Renamed6257 = param1;
      }
      
      public function get particleTextureResource() : MultiframeImageResource
      {
         return this.Renamed6258;
      }
      
      public function set particleTextureResource(param1:MultiframeImageResource) : void
      {
         this.Renamed6258 = param1;
      }
      
      public function get planeTextureResource() : MultiframeImageResource
      {
         return this.Renamed6259;
      }
      
      public function set planeTextureResource(param1:MultiframeImageResource) : void
      {
         this.Renamed6259 = param1;
      }
      
      public function get shotSoundResource() : SoundResource
      {
         return this.Renamed6260;
      }
      
      public function set shotSoundResource(param1:SoundResource) : void
      {
         this.Renamed6260 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "FreezeSFXCC [";
         _loc1_ += "particleSpeed = " + this.particleSpeed + " ";
         _loc1_ += "particleTextureResource = " + this.particleTextureResource + " ";
         _loc1_ += "planeTextureResource = " + this.planeTextureResource + " ";
         _loc1_ += "shotSoundResource = " + this.shotSoundResource + " ";
         return _loc1_ + "]";
      }
   }
}

