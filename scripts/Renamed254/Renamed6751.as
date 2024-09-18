package Renamed4594
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class Renamed6339
   {
      private var Renamed6743:Vector.<Renamed6342>;
      
      private var Renamed6744:Tanks3DSResource;
      
      private var Renamed6745:Tanks3DSResource;
      
      private var Renamed6746:ImageResource;
      
      private var Renamed6747:ImageResource;
      
      private var Renamed6748:Tanks3DSResource;
      
      private var Renamed6749:Vector.<Renamed6340>;
      
      private var Renamed6115:Renamed6343;
      
      public function Renamed6339(param1:Vector.<Renamed6342> = null, param2:Tanks3DSResource = null, param3:Tanks3DSResource = null, param4:ImageResource = null, param5:ImageResource = null, param6:Tanks3DSResource = null, param7:Vector.<Renamed6340> = null, param8:Renamed6343 = null)
      {
         super();
         this.Renamed6743 = param1;
         this.Renamed6744 = param2;
         this.Renamed6745 = param3;
         this.Renamed6746 = param4;
         this.Renamed6747 = param5;
         this.Renamed6748 = param6;
         this.Renamed6749 = param7;
         this.Renamed6115 = param8;
      }
      
      public function get Renamed6358() : Vector.<Renamed6342>
      {
         return this.Renamed6743;
      }
      
      public function set Renamed6358(param1:Vector.<Renamed6342>) : void
      {
         this.Renamed6743 = param1;
      }
      
      public function get Renamed6750() : Tanks3DSResource
      {
         return this.Renamed6744;
      }
      
      public function set Renamed6750(param1:Tanks3DSResource) : void
      {
         this.Renamed6744 = param1;
      }
      
      public function get Renamed6360() : Tanks3DSResource
      {
         return this.Renamed6745;
      }
      
      public function set Renamed6360(param1:Tanks3DSResource) : void
      {
         this.Renamed6745 = param1;
      }
      
      public function get Renamed6359() : ImageResource
      {
         return this.Renamed6746;
      }
      
      public function set Renamed6359(param1:ImageResource) : void
      {
         this.Renamed6746 = param1;
      }
      
      public function get Renamed6363() : ImageResource
      {
         return this.Renamed6747;
      }
      
      public function set Renamed6363(param1:ImageResource) : void
      {
         this.Renamed6747 = param1;
      }
      
      public function get Renamed6361() : Tanks3DSResource
      {
         return this.Renamed6748;
      }
      
      public function set Renamed6361(param1:Tanks3DSResource) : void
      {
         this.Renamed6748 = param1;
      }
      
      public function get Renamed6356() : Vector.<Renamed6340>
      {
         return this.Renamed6749;
      }
      
      public function set Renamed6356(param1:Vector.<Renamed6340>) : void
      {
         this.Renamed6749 = param1;
      }
      
      public function get Renamed974() : Renamed6343
      {
         return this.Renamed6115;
      }
      
      public function set Renamed974(param1:Renamed6343) : void
      {
         this.Renamed6115 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "AssaultCC [";
         _loc1_ += "blueFlags = " + this.Renamed6358 + " ";
         _loc1_ += "flagModel = " + this.Renamed6750 + " ";
         _loc1_ += "flagPedestalModel = " + this.Renamed6360 + " ";
         _loc1_ += "flagSprite = " + this.Renamed6359 + " ";
         _loc1_ += "pointCircleTexture = " + this.Renamed6363 + " ";
         _loc1_ += "pointPedestalModel = " + this.Renamed6361 + " ";
         _loc1_ += "redBases = " + this.Renamed6356 + " ";
         _loc1_ += "sounds = " + this.Renamed974 + " ";
         return _loc1_ + "]";
      }
   }
}

