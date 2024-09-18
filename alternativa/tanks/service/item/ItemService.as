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
      
      function §^#x§(param1:IGameObject) : ItemViewCategoryEnum;
      
      function §8#X§(param1:ItemCategoryEnum) : void;
      
      function §;#U§(param1:IGameObject) : Vector.<IGameObject>;
      
      function §final var catch§(param1:IGameObject) : int;
      
      function getProperties(param1:IGameObject) : Vector.<ItemPropertyValue>;
      
      function §6#y§(param1:IGameObject) : IGameObject;
      
      function getName(param1:IGameObject) : String;
      
      function getDescription(param1:IGameObject) : String;
      
      function §!#P§(param1:IGameObject) : IGameObject;
      
      function getPosition(param1:IGameObject) : int;
      
      function getPrice(param1:IGameObject) : int;
      
      function isBuyable(param1:IGameObject) : Boolean;
      
      function getDiscount(param1:IGameObject) : int;
      
      function isUpgrading(param1:IGameObject) : Boolean;
      
      function getUpgradingProperty(param1:IGameObject) : ItemGarageProperty;
      
      function §!"p§(param1:IGameObject) : Boolean;
      
      function getEndDiscountTimer(param1:IGameObject) : CountDownTimer;
      
      function getPriceWithoutDiscount(param1:IGameObject) : int;
      
      function §2"J§(param1:IGameObject) : Boolean;
      
      function isGrouped(param1:IGameObject) : Boolean;
      
      function §extends const each§(param1:IGameObject) : Boolean;
      
      function isCountable(param1:IGameObject) : Boolean;
      
      function §static set default§(param1:IGameObject) : Boolean;
      
      function §while try§(param1:IGameObject) : Boolean;
      
      function canBuy(param1:IGameObject) : Boolean;
      
      function §include for each§(param1:IGameObject) : Boolean;
      
      function §null var continue§(param1:IGameObject) : Boolean;
      
      function reset() : void;
      
      function getUpgradableProperties(param1:IGameObject) : Vector.<UpgradableItemPropertyValue>;
      
      function getModificationIndex(param1:IGameObject) : int;
      
      function hasNextModification(param1:IGameObject) : Boolean;
      
      function §override const class§(param1:IGameObject) : IGameObject;
      
      function §0",§(param1:IGameObject) : IGameObject;
      
      function §case const else§(param1:IGameObject) : IGameObject;
      
      function getCount(param1:IGameObject) : int;
      
      function setCount(param1:IGameObject, param2:int) : void;
      
      function §,$!§(param1:IGameObject) : int;
      
      function §[!@§(param1:IGameObject) : int;
      
      function §,!S§(param1:IGameObject) : Boolean;
      
      function mountItem(param1:IGameObject) : void;
      
      function isFullUpgraded(param1:IGameObject) : Boolean;
      
      function getTimeLeftInSeconds(param1:IGameObject) : int;
      
      function §[#e§(param1:IGameObject) : Boolean;
      
      function §>#J§(param1:IGameObject) : Boolean;
   }
}

