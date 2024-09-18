package Renamed4594
{
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class Renamed6343
   {
      private var Renamed6769:SoundResource;
      
      private var Renamed6770:SoundResource;
      
      private var Renamed6771:SoundResource;
      
      private var Renamed6772:SoundResource;
      
      public function Renamed6343(param1:SoundResource = null, param2:SoundResource = null, param3:SoundResource = null, param4:SoundResource = null)
      {
         super();
         this.Renamed6769 = param1;
         this.Renamed6770 = param2;
         this.Renamed6771 = param3;
         this.Renamed6772 = param4;
      }
      
      public function get Renamed5456() : SoundResource
      {
         return this.Renamed6769;
      }
      
      public function set Renamed5456(param1:SoundResource) : void
      {
         this.Renamed6769 = param1;
      }
      
      public function get Renamed5457() : SoundResource
      {
         return this.Renamed6770;
      }
      
      public function set Renamed5457(param1:SoundResource) : void
      {
         this.Renamed6770 = param1;
      }
      
      public function get Renamed5458() : SoundResource
      {
         return this.Renamed6771;
      }
      
      public function set Renamed5458(param1:SoundResource) : void
      {
         this.Renamed6771 = param1;
      }
      
      public function get Renamed5459() : SoundResource
      {
         return this.Renamed6772;
      }
      
      public function set Renamed5459(param1:SoundResource) : void
      {
         this.Renamed6772 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "AssaultSoundFX [";
         _loc1_ += "flagDropSound = " + this.Renamed5456 + " ";
         _loc1_ += "flagReturnSound = " + this.Renamed5457 + " ";
         _loc1_ += "flagTakeSound = " + this.Renamed5458 + " ";
         _loc1_ += "winSound = " + this.Renamed5459 + " ";
         return _loc1_ + "]";
      }
   }
}

