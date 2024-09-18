package alternativa.proplib
{
   public class PropLibRegistry
   {
      private var libs:Object;
      
      public function PropLibRegistry()
      {
         this.libs = {};
         super();
      }
      
      public function addLibrary(param1:PropLibrary) : void
      {
         this.libs[param1.name] = param1;
      }
      
      public function getLibrary(param1:String) : PropLibrary
      {
         return this.libs[param1];
      }
      
      public function get libraries() : Vector.<PropLibrary>
      {
         var _loc2_:PropLibrary = null;
         var _loc1_:Vector.<PropLibrary> = new Vector.<PropLibrary>();
         for each(_loc2_ in this.libs)
         {
            _loc1_.push(_loc2_);
         }
         return _loc1_;
      }
   }
}

