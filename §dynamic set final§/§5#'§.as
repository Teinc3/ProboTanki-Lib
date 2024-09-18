package §dynamic set final§
{
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class §5#'§
   {
      private var §@"Y§:SoundResource;
      
      public function §5#'§(param1:SoundResource = null)
      {
         super();
         this.§@"Y§ = param1;
      }
      
      public function get §for package const§() : SoundResource
      {
         return this.§@"Y§;
      }
      
      public function set §for package const§(param1:SoundResource) : void
      {
         this.§@"Y§ = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "TankRankUpEffectCC [";
         _loc1_ += "rankUpSound = " + this.§for package const§ + " ";
         return _loc1_ + "]";
      }
   }
}

