package alternativa.tanks.model.item.category
{
   import projects.tanks.client.commons.types.ItemViewCategoryEnum;
   
   public interface IItemViewCategory
   {
      function getCategory() : ItemViewCategoryEnum;
      
      function setCategory(param1:ItemViewCategoryEnum) : void;
   }
}

