package alternativa.tanks.model.item.category
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.commons.types.ItemCategoryEnum;
   
   public class IItemCategoryAdapt implements IItemCategory
   {
      private var object:IGameObject;
      
      private var impl:IItemCategory;
      
      public function IItemCategoryAdapt(param1:IGameObject, param2:IItemCategory)
      {
         super();
         this.object = param1;
         this.impl = param2;
      }
      
      public function getCategory() : ItemCategoryEnum
      {
         var result:ItemCategoryEnum = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getCategory();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function setCategory(param1:ItemCategoryEnum) : void
      {
         var category:ItemCategoryEnum = param1;
         try
         {
            Model.object = this.object;
            this.impl.setCategory(category);
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

