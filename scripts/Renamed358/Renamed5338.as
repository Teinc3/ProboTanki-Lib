package Renamed358
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class Renamed5338
   {
      private var Renamed8150:Tanks3DSResource;
      
      private var Renamed8151:ImageResource;
      
      private var Renamed8152:Tanks3DSResource;
      
      private var Renamed8153:Tanks3DSResource;
      
      private var Renamed8154:SoundResource;
      
      private var Renamed8155:int;
      
      public function Renamed5338(param1:Tanks3DSResource = null, param2:ImageResource = null, param3:Tanks3DSResource = null, param4:Tanks3DSResource = null, param5:SoundResource = null, param6:int = 0)
      {
         super();
         this.Renamed8150 = param1;
         this.Renamed8151 = param2;
         this.Renamed8152 = param3;
         this.Renamed8153 = param4;
         this.Renamed8154 = param5;
         this.Renamed8155 = param6;
      }
      
      public function get CodecRegisterer9() : Tanks3DSResource
      {
         return this.Renamed8150;
      }
      
      public function set CodecRegisterer9(param1:Tanks3DSResource) : void
      {
         this.Renamed8150 = param1;
      }
      
      public function get cordResource() : ImageResource
      {
         return this.Renamed8151;
      }
      
      public function set cordResource(param1:ImageResource) : void
      {
         this.Renamed8151 = param1;
      }
      
      public function get parachuteInnerResource() : Tanks3DSResource
      {
         return this.Renamed8152;
      }
      
      public function set parachuteInnerResource(param1:Tanks3DSResource) : void
      {
         this.Renamed8152 = param1;
      }
      
      public function get parachuteResource() : Tanks3DSResource
      {
         return this.Renamed8153;
      }
      
      public function set parachuteResource(param1:Tanks3DSResource) : void
      {
         this.Renamed8153 = param1;
      }
      
      public function get pickupSoundResource() : SoundResource
      {
         return this.Renamed8154;
      }
      
      public function set pickupSoundResource(param1:SoundResource) : void
      {
         this.Renamed8154 = param1;
      }
      
      public function get lifeTimeMs() : int
      {
         return this.Renamed8155;
      }
      
      public function set lifeTimeMs(param1:int) : void
      {
         this.Renamed8155 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "BonusCommonCC [";
         _loc1_ += "boxResource = " + this.CodecRegisterer9 + " ";
         _loc1_ += "cordResource = " + this.cordResource + " ";
         _loc1_ += "parachuteInnerResource = " + this.parachuteInnerResource + " ";
         _loc1_ += "parachuteResource = " + this.parachuteResource + " ";
         _loc1_ += "pickupSoundResource = " + this.pickupSoundResource + " ";
         _loc1_ += "lifeTimeMs = " + this.lifeTimeMs + " ";
         return _loc1_ + "]";
      }
   }
}

