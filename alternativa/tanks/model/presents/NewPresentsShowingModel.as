package alternativa.tanks.model.presents
{
   import §?#7§.§3@§;
   import §?#7§.§for var case§;
   import alternativa.tanks.gui.presents.NewPresentsAlert;
   import alternativa.tanks.gui.presents.NewPresentsAlertEvent;
   import alternativa.tanks.service.notificationcategories.INotificationGarageCategoriesService;
   import projects.tanks.client.commons.types.ItemViewCategoryEnum;
   
   public class NewPresentsShowingModel extends §for var case§ implements §3@§
   {
      [Inject]
      public static var notificationGarageCategoriesService:INotificationGarageCategoriesService;
      
      public function NewPresentsShowingModel()
      {
         super();
      }
      
      public function showAlert() : void
      {
         var _loc1_:NewPresentsAlert = new NewPresentsAlert();
         _loc1_.addEventListener(NewPresentsAlertEvent.ACCEPT,this.accept);
         _loc1_.addEventListener(NewPresentsAlertEvent.CANCEL,this.cancel);
         notificationGarageCategoriesService.§^!L§(ItemViewCategoryEnum.GIVEN_PRESENTS);
      }
      
      private function cancel(param1:NewPresentsAlertEvent) : void
      {
         this.closeDialog(NewPresentsAlert(param1.target));
      }
      
      private function accept(param1:NewPresentsAlertEvent) : void
      {
         this.closeDialog(NewPresentsAlert(param1.target));
         server.§case set if§();
      }
      
      private function closeDialog(param1:NewPresentsAlert) : void
      {
         param1.removeEventListener(NewPresentsAlertEvent.ACCEPT,this.accept);
         param1.removeEventListener(NewPresentsAlertEvent.CANCEL,this.cancel);
      }
   }
}

