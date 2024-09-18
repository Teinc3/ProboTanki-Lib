package alternativa.tanks.service.notificationcategories
{
   import flash.events.EventDispatcher;
   import projects.tanks.client.commons.types.ItemViewCategoryEnum;
   import projects.tanks.client.panel.model.garage.GarageItemInfo;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   
   public class Renamed572 extends EventDispatcher implements INotificationGarageCategoriesService
   {
      [Inject]
      public static var storageService:IStorageService;
      
      private static const Renamed3718:String = "NEW_ITEM_NOTIFICATION_IN_CATEGORY";
      
      public function Renamed572()
      {
         super();
      }
      
      public function Renamed2115(param1:Vector.<GarageItemInfo>) : void
      {
         var _loc2_:ItemViewCategoryEnum = null;
         var _loc3_:int = int(param1.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1[_loc4_].itemViewCategory;
            if(!this.Renamed1929(_loc2_))
            {
               this.Renamed3719(_loc2_);
            }
            _loc4_++;
         }
         dispatchEvent(new NotificationGarageCategoriesEvent(NotificationGarageCategoriesEvent.NOTIFICATION_CHANGE));
      }
      
      private function Renamed3719(param1:ItemViewCategoryEnum) : void
      {
         storageService.getStorage().data[this.Renamed3720(param1)] = true;
      }
      
      public function Renamed1930(param1:ItemViewCategoryEnum) : void
      {
         storageService.getStorage().data[this.Renamed3720(param1)] = false;
      }
      
      public function Renamed1929(param1:ItemViewCategoryEnum) : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc3_:String = this.Renamed3720(param1);
         if(storageService.getStorage().data.hasOwnProperty(_loc3_))
         {
            _loc2_ = Boolean(storageService.getStorage().data[_loc3_]);
         }
         return _loc2_;
      }
      
      private function Renamed3720(param1:ItemViewCategoryEnum) : String
      {
         return Renamed3718 + param1.value;
      }
      
      public function Renamed2173(param1:ItemViewCategoryEnum) : void
      {
         this.Renamed3719(param1);
      }
   }
}

