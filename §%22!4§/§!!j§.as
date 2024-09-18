package §"!4§
{
   public class §!!j§
   {
      private var §4"k§:Boolean;
      
      private var §use set use§:Boolean;
      
      public function §!!j§(param1:Boolean = false, param2:Boolean = false)
      {
         super();
         this.§4"k§ = param1;
         this.§use set use§ = param2;
      }
      
      public function get §5!`§() : Boolean
      {
         return this.§4"k§;
      }
      
      public function set §5!`§(param1:Boolean) : void
      {
         this.§4"k§ = param1;
      }
      
      public function get §0"7§() : Boolean
      {
         return this.§use set use§;
      }
      
      public function set §0"7§(param1:Boolean) : void
      {
         this.§use set use§ = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "InventoryCC [";
         _loc1_ += "alternativeCooldownsEnabled = " + this.§5!`§ + " ";
         _loc1_ += "ultimateEnabled = " + this.§0"7§ + " ";
         return _loc1_ + "]";
      }
   }
}

