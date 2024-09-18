package projects.tanks.clients.fp10.libraries.tanksservices.model.friends.acceptednotificator
{
   import alternativa.osgi.service.logging.LogService;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import projects.tanks.client.users.model.friends.container.UserContainerCC;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.NewFriendRemoveEvent;
   import §static var throw§.§="o§;
   import §static var throw§.§function var try§;
   
   public class FriendsAcceptedNotificatorModel extends §function var try§ implements §="o§, ObjectLoadListener, ObjectUnloadListener
   {
      [Inject]
      public static var logService:LogService;
      
      [Inject]
      public static var friendsInfoService:IFriendInfoService;
      
      public function FriendsAcceptedNotificatorModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         var _loc1_:UserContainerCC = null;
         var _loc2_:String = null;
         _loc1_ = getInitParam();
         for each(_loc2_ in _loc1_.users)
         {
            friendsInfoService.onAddNewAcceptedFriend(_loc2_);
         }
         friendsInfoService.addEventListener(NewFriendRemoveEvent.ACCEPTED,this.remove);
      }
      
      private function remove(param1:NewFriendRemoveEvent) : void
      {
         server.remove(param1.userId);
      }
      
      public function onAdding(param1:String) : void
      {
         friendsInfoService.onAddNewAcceptedFriend(param1);
      }
      
      public function onRemoved(param1:String) : void
      {
         friendsInfoService.onRemoveNewAcceptedFriend(param1);
      }
      
      public function objectUnloaded() : void
      {
         friendsInfoService.removeEventListener(NewFriendRemoveEvent.ACCEPTED,this.remove);
      }
   }
}

