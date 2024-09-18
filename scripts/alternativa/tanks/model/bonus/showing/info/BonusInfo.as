package alternativa.tanks.model.bonus.showing.info
{
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public interface BonusInfo
   {
      function getTopText() : String;
      
      function getBottomText() : String;
      
      function getImage() : ImageResource;
   }
}

