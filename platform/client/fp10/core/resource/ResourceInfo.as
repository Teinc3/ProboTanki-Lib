package platform.client.fp10.core.resource
{
   import alternativa.types.Long;
   
   public class ResourceInfo
   {
      public var type:int;
      
      public var id:Long;
      
      public var version:Long;
      
      public var isLazy:Boolean;
      
      public var resourceParams:Object;
      
      public var §class const set§:Vector.<§7"'§>;
      
      private var §default catch false§:Object;
      
      public function ResourceInfo(param1:int, param2:Long, param3:Long, param4:Boolean, param5:Object = null, param6:Vector.<§7"'§> = null)
      {
         var _loc7_:§7"'§ = null;
         this.§default catch false§ = {};
         super();
         this.type = param1;
         this.id = param2;
         this.version = param3;
         this.isLazy = param4;
         this.resourceParams = param5;
         this.§class const set§ = param6;
         for each(_loc7_ in param6)
         {
            this.§default catch false§[_loc7_.§in package false§] = _loc7_;
         }
      }
      
      public function §2#'§(param1:String) : §7"'§
      {
         return this.§default catch false§[param1];
      }
      
      public function toString() : String
      {
         return "[ResourceInfo type=" + this.type + ", id=" + this.id + ", version=" + this.version + ", isLazy=" + this.isLazy + ", fileInfos=" + this.§class const set§ + "]";
      }
   }
}

