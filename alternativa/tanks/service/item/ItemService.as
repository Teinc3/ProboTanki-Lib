package alternativa.tanks.service.item
{
   import alternativa.tanks.model.item.properties.ItemPropertyValue;
   import alternativa.tanks.model.item.upgradable.UpgradableItemPropertyValue;
   import controls.timer.CountDownTimer;
   import flash.events.IEventDispatcher;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.commons.types.ItemCategoryEnum;
   import projects.tanks.client.commons.types.ItemViewCategoryEnum;
   import projects.tanks.client.garage.models.item.properties.ItemGarageProperty;
   
   public interface ItemService extends IEventDispatcher
   {
      function getPreviewResource(param1:IGameObject) : ImageResource;
      
      function addItem(param1:IGameObject) : void;
      
      function removeItem(param1:IGameObject) : void;
      
      function getCategory(param1:IGameObject) : ItemCategoryEnum;
      
      function Renamed1934(param1:IGameObject) : ItemViewCategoryEnum;
      
      function Renamed2099(param1:ItemCategoryEnum) : void;
      
      function Renamed1706(param1:IGameObject) : Vector.<IGameObject>;
      
      function Renamed3677(param1:IGameObject) : int;
      
      function getProperties(param1:IGameObject) : Vector.<ItemPropertyValue>;
      
      function Renamed1705(param1:IGameObject) : IGameObject;
      
      function getName(param1:IGameObject) : String;
      
      function getDescription(param1:IGameObject) : String;
      
      function Renamed2102(param1:IGameObject) : IGameObject;
      
      function getPosition(param1:IGameObject) : int;
      
      function getPrice(param1:IGameObject) : int;
      
      function isBuyable(param1:IGameObject) : Boolean;
      
      function getDiscount(param1:IGameObject) : int;
      
      function isUpgrading(param1:IGameObject) : Boolean;
      
      function getUpgradingProperty(param1:IGameObject) : ItemGarageProperty;
      
      function Renamed1704(param1:IGameObject) : Boolean;
      
      function getEndDiscountTimer(param1:IGameObject) : CountDownTimer;
      
      function getPriceWithoutDiscount(param1:IGameObject) : int;
      
      function Renamed1700(param1:IGameObject) : Boolean;
      
      function isGrouped(param1:IGameObject) : Boolean;
      
      function Renamed2105(param1:IGameObject) : Boolean;
      
      function isCountable(param1:IGameObject) : Boolean;
      
      function Renamed1768(param1:IGameObject) : Boolean;
      
      function Renamed1760(param1:IGameObject) : Boolean;
      
      function canBuy(param1:IGameObject) : Boolean;
      
      function Renamed1772(param1:IGameObject) : Boolean;
      
      function Renamed1773(param1:IGameObject) : Boolean;
      
      function reset() : void;
      
      function getUpgradableProperties(param1:IGameObject) : Vector.<UpgradableItemPropertyValue>;
      
      function getModificationIndex(param1:IGameObject) : int;
      
      function hasNextModification(param1:IGameObject) : Boolean;
      
      function Renamed1932(param1:IGameObject) : IGameObject;
      
      function Renamed1935(param1:IGameObject) : IGameObject;
      
      function Renamed1931(param1:IGameObject) : IGameObject;
      
      function getCount(param1:IGameObject) : int;
      
      function setCount(param1:IGameObject, param2:int) : void;
      
      function Renamed1764(param1:IGameObject) : int;
      
      function Renamed1763(param1:IGameObject) : int;
      
      function Renamed1774(param1:IGameObject) : Boolean;
      
      function mountItem(param1:IGameObject) : void;
      
      function isFullUpgraded(param1:IGameObject) : Boolean;
      
      function getTimeLeftInSeconds(param1:IGameObject) : int;
      
      function Renamed1701(param1:IGameObject) : Boolean;
      
      function Renamed1702(param1:IGameObject) : Boolean;
   }
}

