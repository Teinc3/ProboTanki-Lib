package §class const var§
{
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class §6z§
   {
      private var _count:int;
      
      private var §?"4§:ImageResource;
      
      public function §6z§(param1:int = 0, param2:ImageResource = null)
      {
         super();
         this._count = param1;
         this.§?"4§ = param2;
      }
      
      public function get count() : int
      {
         return this._count;
      }
      
      public function set count(param1:int) : void
      {
         this._count = param1;
      }
      
      public function get §super const return§() : ImageResource
      {
         return this.§?"4§;
      }
      
      public function set §super const return§(param1:ImageResource) : void
      {
         this.§?"4§ = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "WeeklyQuestRewardItem [";
         _loc1_ += "count = " + this.count + " ";
         _loc1_ += "itemImage = " + this.§super const return§ + " ";
         return _loc1_ + "]";
      }
   }
}

