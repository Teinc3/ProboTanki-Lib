package §4"%§
{
   import flash.filters.BitmapFilter;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §0!#§ implements §80§
   {
      private var object:IGameObject;
      
      private var impl:Vector.<§80§>;
      
      public function §0!#§(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<§80§>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function createFilter(param1:String) : BitmapFilter
      {
         var result:BitmapFilter = null;
         var i:int = 0;
         var m:§80§ = null;
         var key:String = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.createFilter(key);
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

