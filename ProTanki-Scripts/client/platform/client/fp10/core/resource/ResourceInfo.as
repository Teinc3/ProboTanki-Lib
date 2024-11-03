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
      
      public var Renamed4104:Vector.<Renamed4105>;
      
      private var Renamed4106:Object;
      
      public function ResourceInfo(param1:int, param2:Long, param3:Long, param4:Boolean, param5:Object = null, param6:Vector.<Renamed4105> = null)
      {
         var _loc7_:Renamed4105 = null;
         this.Renamed4106 = {};
         super();
         this.type = param1;
         this.id = param2;
         this.version = param3;
         this.isLazy = param4;
         this.resourceParams = param5;
         this.Renamed4104 = param6;
         for each(_loc7_ in param6)
         {
            this.Renamed4106[_loc7_.Renamed4107] = _loc7_;
         }
      }
      
      public function Renamed4108(param1:String) : Renamed4105
      {
         return this.Renamed4106[param1];
      }
      
      public function toString() : String
      {
         return "[ResourceInfo type=" + this.type + ", id=" + this.id + ", version=" + this.version + ", isLazy=" + this.isLazy + ", fileInfos=" + this.Renamed4104 + "]";
      }
   }
}

