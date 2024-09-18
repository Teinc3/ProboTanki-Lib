package alternativa.tanks.model.item.temporary
{
   import alternativa.tanks.service.temporaryitem.ITemporaryItemService;
   import alternativa.tanks.service.temporaryitemnotify.ITemporaryItemNotifyService;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.garage.models.item.temporary.ITemporaryItemModelBase;
   import projects.tanks.client.garage.models.item.temporary.TemporaryItemModelBase;
   
   public class TemporaryItemModel extends TemporaryItemModelBase implements ITemporaryItemModelBase, ITemporaryItem, IObjectLoadListener
   {
      [Inject]
      public static var temporaryItemService:ITemporaryItemService;
      
      [Inject]
      public static var temporaryItemNotifyService:ITemporaryItemNotifyService;
      
      public function TemporaryItemModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         var _loc1_:int = getInitParam().remainingTimeInSec;
         if(_loc1_ > 0)
         {
            this.startTemporaryItem(object,_loc1_);
         }
      }
      
      public function objectLoadedPost() : void
      {
      }
      
      public function objectUnloaded() : void
      {
         this.stopTemporaryItem(object);
      }
      
      public function objectUnloadedPost() : void
      {
      }
      
      public function getStopDate() : Date
      {
         return new Date(new Date().getTime() + temporaryItemService.Renamed2146(object));
      }
      
      public function getTimeRemainingInMSec() : Number
      {
         return temporaryItemService.Renamed2146(object);
      }
      
      public function startTiming(param1:int) : void
      {
         this.startTemporaryItem(object,getInitParam().lifeTimeInSec + param1);
      }
      
      private function startTemporaryItem(param1:IGameObject, param2:int) : void
      {
         temporaryItemService.Renamed2147(param1,param2);
      }
      
      private function stopTemporaryItem(param1:IGameObject) : void
      {
         temporaryItemService.Renamed2148(param1);
      }
   }
}

