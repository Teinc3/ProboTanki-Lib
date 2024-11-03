package alternativa.tanks.model.item.modification
{
   import alternativa.types.Long;
   
   public interface IModification
   {
      function getBaseItemId() : Long;
      
      function getModificationIndex() : int;
   }
}

