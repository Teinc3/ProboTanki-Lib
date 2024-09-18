package alternativa.tanks.model.item.category
{
   import projects.tanks.client.commons.types.ItemCategoryEnum;
   
   public interface IItemCategory
   {
      function getCategory() : ItemCategoryEnum;
      
      function setCategory(param1:ItemCategoryEnum) : void;
   }
}

