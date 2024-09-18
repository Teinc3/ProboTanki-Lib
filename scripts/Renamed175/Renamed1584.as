package Renamed1583
{
   import Renamed1614.Renamed1615;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.battleservice.Renamed1587;
   
   public interface Renamed1584
   {
      function Renamed2080() : Vector.<IGameObject>;
      
      function getName() : String;
      
      function Renamed1594() : String;
      
      function Renamed1595() : int;
      
      function getMaxRank() : int;
      
      function getMinRank() : int;
      
      function getThemeName() : String;
      
      function Renamed1596() : Renamed1615;
      
      function Renamed1597() : Vector.<Renamed1587>;
      
      function isEnabled() : Boolean;
      
      function getAdditionalCrystalsPercent() : int;
      
      function getPreviewResource() : ImageResource;
   }
}

