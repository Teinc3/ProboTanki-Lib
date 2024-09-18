package alternativa.tanks.service.notificationcategories
{
   import flash.events.EventDispatcher;
   import projects.tanks.client.commons.types.ItemViewCategoryEnum;
   import projects.tanks.client.panel.model.garage.GarageItemInfo;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   
   public class §]"S§ extends EventDispatcher implements INotificationGarageCategoriesService
   {
      [Inject]
      public static var storageService:IStorageService;
      
      private static const §["%§:String = "NEW_ITEM_NOTIFICATION_IN_CATEGORY";
      
      public function §]"S§()
      {
         super();
      }
      
      public function §native const else§(param1:Vector.<GarageItemInfo>) : void
      {
         var _loc2_:ItemViewCategoryEnum = null;
         var _loc3_:int = int(param1.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = param1[_loc4_].itemViewCategory;
            if(!this.§do for finally§(_loc2_))
            {
               this.§<"W§(_loc2_);
            }
            _loc4_++;
         }
         dispatchEvent(new NotificationGarageCategoriesEvent(NotificationGarageCategoriesEvent.NOTIFICATION_CHANGE));
      }
      
      private function §<"W§(param1:ItemViewCategoryEnum) : void
      {
         storageService.getStorage().data[this.§2#2§(param1)] = true;
      }
      
      public function §[n§(param1:ItemViewCategoryEnum) : void
      {
         storageService.getStorage().data[this.§2#2§(param1)] = false;
      }
      
      public function §do for finally§(param1:ItemViewCategoryEnum) : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc3_:String = this.§2#2§(param1);
         if(storageService.getStorage().data.hasOwnProperty(_loc3_))
         {
            _loc2_ = Boolean(storageService.getStorage().data[_loc3_]);
         }
         return _loc2_;
      }
      
      private function §2#2§(param1:ItemViewCategoryEnum) : String
      {
         return §["%§ + param1.value;
      }
      
      public function §^!L§(param1:ItemViewCategoryEnum) : void
      {
         this.§<"W§(param1);
      }
   }
}

