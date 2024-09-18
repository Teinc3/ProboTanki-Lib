package alternativa.tanks.bonuses
{
   import platform.client.fp10.core.type.AutoClosable;
   
   public class ObjectCache
   {
      private var size:int;
      
      private var objects:Vector.<Object>;
      
      public function ObjectCache()
      {
         this.objects = new Vector.<Object>();
         super();
      }
      
      public function put(param1:Object) : void
      {
         var _loc2_:* = this.size++;
         this.objects[_loc2_] = param1;
      }
      
      public function get() : Object
      {
         if(this.isEmpty())
         {
            throw new Error();
         }
         --this.size;
         var _loc1_:Object = this.objects[this.size];
         this.objects[this.size] = null;
         return _loc1_;
      }
      
      public function isEmpty() : Boolean
      {
         return this.size == 0;
      }
      
      public function clear() : void
      {
         var _loc1_:Object = null;
         for each(_loc1_ in this.objects)
         {
            if(_loc1_ is AutoClosable)
            {
               AutoClosable(_loc1_).close();
            }
         }
         this.objects.length = 0;
         this.size = 0;
      }
   }
}

