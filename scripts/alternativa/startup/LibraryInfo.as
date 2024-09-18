package alternativa.startup
{
   import alternativa.utils.Properties;
   import flash.display.Loader;
   
   public class LibraryInfo
   {
      public var name:String;
      
      public var resourceId:String;
      
      public var resourceVersion:String;
      
      public var manifestProperties:Properties;
      
      public var loader:Loader;
      
      public var size:int;
      
      public function LibraryInfo(param1:String, param2:String, param3:String, param4:Properties, param5:int)
      {
         super();
         this.name = param1;
         this.resourceId = param2;
         this.resourceVersion = param3;
         this.manifestProperties = param4;
         this.size = param5;
      }
      
      public function toString() : String
      {
         return "[BundleInfo name=" + this.name + ", id=" + this.resourceId + ", version=" + this.resourceVersion + ", manifestProperties=" + this.manifestProperties + ", size=" + this.size;
      }
   }
}

