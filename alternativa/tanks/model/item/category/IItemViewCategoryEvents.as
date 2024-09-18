package alternativa.tanks.model.item.category
{
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.commons.types.ItemViewCategoryEnum;
   
   public class IItemViewCategoryEvents implements IItemViewCategory
   {
      private var object:IGameObject;
      
      private var impl:Vector.<IItemViewCategory>;
      
      public function IItemViewCategoryEvents(param1:IGameObject, param2:Vector.<IModel>)
      {
         super();
         this.object = param1;
         this.impl = new Vector.<IItemViewCategory>();
         var _loc3_:int = 0;
         while(_loc3_ < param2.length)
         {
            this.impl.push(param2[_loc3_]);
            _loc3_++;
         }
      }
      
      public function getCategory() : ItemViewCategoryEnum
      {
         var result:ItemViewCategoryEnum = null;
         var i:int = 0;
         var m:IItemViewCategory = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.getCategory();
               i++;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function setCategory(param1:ItemViewCategoryEnum) : void
      {
         var i:int = 0;
         var m:IItemViewCategory = null;
         var category:ItemViewCategoryEnum = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               m.setCategory(category);
               i++;
            }
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

