package alternativa.tanks.model.item.present
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.client.garage.models.item.present.PresentItemCC;
   
   public interface PresentItem
   {
      function getText() : String;
      
      function getPresenterId() : String;
      
      function getDate() : Date;
      
      function getImage() : ImageResource;
      
      function getConstructor() : PresentItemCC;
   }
}

