package projects.tanks.clients.fp10.libraries.tanksservices.model.listener
{
   import alternativa.osgi.OSGi;
   import alternativa.types.Long;
   import §implements const catch§.§[!a§;
   import §implements const catch§.§case catch return§;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.UserRefresh;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.UserInfoConsumer;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class UserNotifierModel extends §[!a§ implements §case catch return§, UserNotifier, ObjectLoadListener, ObjectUnloadListener
   {
      [Inject]
      public static var userInfoService:IUserInfoService;
      
      public function UserNotifierModel()
      {
         super();
      }
      
      public function subcribe(param1:String, param2:UserInfoConsumer) : void
      {
         this.refresh(param1,param2);
         server.subscribe(param1);
      }
      
      public function refresh(param1:String, param2:UserInfoConsumer) : void
      {
         UserRefresh(modelRegistry.getModel(Long.getLong(904565121,-177943041))).refresh(param1,param2);
         UserRefresh(modelRegistry.getModel(Long.getLong(467887314,-1426971041))).refresh(param1,param2);
         UserRefresh(modelRegistry.getModel(Long.getLong(302389563,-1379937773))).refresh(param1,param2);
         UserRefresh(modelRegistry.getModel(Long.getLong(60229216,350352129))).refresh(param1,param2);
         UserRefresh(modelRegistry.getModel(Long.getLong(990863444,376077627))).refresh(param1,param2);
      }
      
      public function unsubcribe(param1:Vector.<String>) : void
      {
         var _loc2_:String = null;
         for each(_loc2_ in param1)
         {
            UserRefresh(modelRegistry.getModel(Long.getLong(904565121,-177943041))).remove(_loc2_);
            UserRefresh(modelRegistry.getModel(Long.getLong(467887314,-1426971041))).remove(_loc2_);
            UserRefresh(modelRegistry.getModel(Long.getLong(302389563,-1379937773))).remove(_loc2_);
            UserRefresh(modelRegistry.getModel(Long.getLong(60229216,350352129))).remove(_loc2_);
            UserRefresh(modelRegistry.getModel(Long.getLong(990863444,376077627))).remove(_loc2_);
         }
         server.§use const const§(param1);
      }
      
      public function hasDataConsumer(param1:String) : Boolean
      {
         return userInfoService.hasConsumer(param1);
      }
      
      public function getDataConsumer(param1:String) : UserInfoConsumer
      {
         return userInfoService.getConsumer(param1);
      }
      
      public function objectLoaded() : void
      {
         userInfoService.init();
      }
      
      public function objectUnloaded() : void
      {
         userInfoService.unload();
      }
      
      public function getCurrentUserId() : String
      {
         var _loc1_:IUserPropertiesService = OSGi.getInstance().getService(IUserPropertiesService) as IUserPropertiesService;
         return _loc1_.userName;
      }
   }
}

