package projects.tanks.clients.flash.commons.models.coloring
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   
   public interface IColoring
   {
      function getColoring() : ImageResource;
      
      function getAnimatedColoring() : MultiframeImageResource;
      
      function isAnimated() : Boolean;
   }
}

