package Renamed344
{
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class Renamed8041
   {
      private var Renamed8042:SoundResource;
      
      public function Renamed8041(param1:SoundResource = null)
      {
         super();
         this.Renamed8042 = param1;
      }
      
      public function get Renamed8043() : SoundResource
      {
         return this.Renamed8042;
      }
      
      public function set Renamed8043(param1:SoundResource) : void
      {
         this.Renamed8042 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "TankRankUpEffectCC [";
         _loc1_ += "rankUpSound = " + this.Renamed8043 + " ";
         return _loc1_ + "]";
      }
   }
}

