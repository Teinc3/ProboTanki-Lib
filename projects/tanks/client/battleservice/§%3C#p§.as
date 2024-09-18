package projects.tanks.client.battleservice
{
   public class §<#p§
   {
      private var §class package catch§:int;
      
      private var §get use§:int;
      
      public function §<#p§(param1:int = 0, param2:int = 0)
      {
         super();
         this.§class package catch§ = param1;
         this.§get use§ = param2;
      }
      
      public function get max() : int
      {
         return this.§class package catch§;
      }
      
      public function set max(param1:int) : void
      {
         this.§class package catch§ = param1;
      }
      
      public function get min() : int
      {
         return this.§get use§;
      }
      
      public function set min(param1:int) : void
      {
         this.§get use§ = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "Range [";
         _loc1_ += "max = " + this.max + " ";
         _loc1_ += "min = " + this.min + " ";
         return _loc1_ + "]";
      }
   }
}

