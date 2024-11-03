package alternativa.tanks.gui
{
   import flash.events.IEventDispatcher;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.commons.types.ItemViewCategoryEnum;
   
   public interface Renamed1689 extends IEventDispatcher
   {
      function mountItem(param1:IGameObject) : void;
      
      function unmountItem(param1:IGameObject) : void;
      
      function updateDiscount(param1:IGameObject) : void;
      
      function Renamed1695() : IGameObject;
      
      function Renamed1696() : ItemInfoPanel;
      
      function addItemToMarket(param1:IGameObject) : void;
      
      function Renamed1703(param1:IGameObject) : void;
      
      function removeItemFromStore(param1:IGameObject) : void;
      
      function removeItemFromDepot(param1:IGameObject) : void;
      
      function Renamed1707() : Vector.<Renamed1691>;
      
      function showCategory(param1:ItemViewCategoryEnum) : void;
   }
}

