package alternativa.tanks.service.notificationcategories
{
   import flash.events.IEventDispatcher;
   import projects.tanks.client.commons.types.ItemViewCategoryEnum;
   import projects.tanks.client.panel.model.garage.GarageItemInfo;
   
   public interface INotificationGarageCategoriesService extends IEventDispatcher
   {
      function Renamed2115(param1:Vector.<GarageItemInfo>) : void;
      
      function Renamed2173(param1:ItemViewCategoryEnum) : void;
      
      function Renamed1929(param1:ItemViewCategoryEnum) : Boolean;
      
      function Renamed1930(param1:ItemViewCategoryEnum) : void;
   }
}

